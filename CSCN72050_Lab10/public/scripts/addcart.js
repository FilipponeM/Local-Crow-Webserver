
function itemsAddedToCart(item, quantity) {

    var action = "/add/" + item + "/" + quantity;

    var requestOptions = {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
    };

    fetch(action, requestOptions);

    var cart = "Your item has been added to your cart!";
    console.log(cart);
    alert(cart);

}

// Function to calculate quantity and add items to the cart
function calculateQuantity(productName) {
    var quantity = document.getElementById("quantity").value;
    itemsAddedToCart(productName, quantity);
}

function confirm() {

    var action = "/get_cart";

    document.getElementById("confirm").action = action;
    document.getElementById("confirm").submit();

    var cart = "Thank you for buying games from Kool Kids";
    console.log(cart);
    alert(cart);
}