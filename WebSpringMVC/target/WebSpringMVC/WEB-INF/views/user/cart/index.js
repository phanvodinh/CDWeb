var xhttp;

// initRequest() dùng để khỏi tạo ajax cho phù hợp với từng trình duyệt
function initRequest() {
    if (window.XMLHttpRequest) {
        // dành cho hầu hết trình duyệt
        xhttp = new XMLHttpRequest();

    }//dành cho trình duyệt InternetExporer
    xhttp = new ActiveXObject("Microsoft.XMLHTTP");
}
//ajax xóa sp khỏi giỏ hàng- chưa xong
$(document).on('click', '#remove-cart', function (event) {
    event.preventDefault();
    var productID = $(this).data('productID').data('remove-cart')
    $.ajax({
        type: 'POST',
        url: '/deletecart',
        data: {'id': id},
        success: function (response) {
            // Cập nhật giỏ hàng trên trang
          //  $('#cart-items').html(response);
            alert('Item removed from cart');
        }
    })
        .fail(function () {
            alert('Failed to remove product from cart');
        });
})