pragma solidity >=0.4.25 <0.6.0;

contract MosesIgbukuToken {
    string public constant name = "FLNToken";
    string public constant symbol = "FLT";
    uint8 public constant decimals = 18;

    using SafeMath for uint256;

    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Mint(address indexed account, uint amount);

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowed;
    uint256 private _totalSupply;

    mapping (address => bool) private _minters;

    address private _owner;

    constructor(uint256 initialSupply) public {
        _totalSupply = initialSupply;
        _owner = msg.sender;
        _balances[_owner] = _totalSupply;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowed[owner][spender];
    }

    function transfer(address to, uint256 value) public returns (bool) {
        require(value <= _balances[msg.sender], "Insufficient balance");
        require(to != address(0), "Invalid receipient address");

        _balances[msg.sender] = _balances[msg.sender].sub(value);
        _balances[to] = _balances[to].add(value);
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) public returns (bool) {
        require(spender != address(0), "Spender address is invalid");

        _allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        require(value <= _balances[from], "Owner has insufficient balance");
        require(value <= _allowed[from][msg.sender], "Transfer amount exceeds allowed value");
        require(to != address(0), "Receipient address is invalid");

        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
        _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);
        emit Transfer(from, to, value);
        return true;
    }

    function mint(address account, uint256 amount) public returns (bool) {
        require(_minters[msg.sender], "Account is not an authorized minter");
        require(amount > 0, "Invalid amount added, should be greater than 0");
        _balances[account] = _balances[account].add(amount);
        _totalSupply = _totalSupply.add(amount);
        emit Mint(account, amount);
        return true;
    }

    function addMinter(address account) public returns (bool) {
        require(msg.sender == _owner, "Account is not authorized to create a minter");
        _minters[account] = true;
        return true;
    }
}

library SafeMath {
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}