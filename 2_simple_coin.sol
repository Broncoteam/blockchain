// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

contract Coin{
    address public minter;
    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor(){
        minter = msg.sender;
    }

    function mint(address reciever, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[reciever] += amount;
    }

    function send(address reciever, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[reciever] += amount;
        emit Sent(msg.sender, reciever, amount);
    }
}
/*
    Address : Tüm hesap ve akıllı sözleşmelerin bir adresi vardır. Hesaplar arasında ether aktarımı için kullanılır.
    Mapping : İlişkileri barındırmak için kullanılan veri türüdür. List e benzer şekilde 2 değer tutar ve hızlıca gönderilen anahtara karşılık gelen değeri almayı sağlar.
    Event : Event çağırıldığında arumanların işlem geçmişinde tutulmasını sağlar.
    Emit : Event ları çağırmaya yarayan sözcüktür. 
    Constructor : Contract oluşturulduğunda çalıştırılan fonksiyondur.
    Msg : Blockchainden bize özel bazı değerlere ulaşmamızı sağlayan anahtar kelime.
    Require : Uygulanmasından önce tespit edilemeyen koşulların geçerliliğini garanti eder.
*/