$(document).ready(() => {

  function moneyMask(value) {
    value = value.toString().replace(/\D/g, "");
    value = value.toString().replace(/(\d)(\d{8})$/, "$1.$2");
    value = value.toString().replace(/(\d)(\d{5})$/, "$1.$2");
    value = value.toString().replace(/(\d)(\d{2})$/, "$1,$2");
    return value;
  }

  function addProductToCart(id) {
    $.ajax({
      type: "POST",
      url: '/note-commerce/shop/cart',
      data: { operation: 'save', productId: id },
      success: function () { },
      dataType: "text"
    });
  }

  function removeProductFromCart(id) {
    $.ajax({
      type: "POST",
      url: '/note-commerce/shop/cart',
      data: { operation: 'remove', productId: id },
      success: function () {
        $("#row_" + id).remove();
        calculateTotal();
      },
      dataType: "text"
    });
  }

  // **************************************************************************************

  /*
    Product filter
  */

  let products = []

  function createProductCard(product) {
    let card = $($('#product-card').html());
    card.find("#product-name-link").text(product.title);
    card.find("#product-name-link").attr('href', "/note-commerce/shop/products?operation=consult&id=" + product.id);
    card.find("#product-image-link").attr('href', "/note-commerce/shop/products?operation=consult&id=" + product.id);
    card.find("#product-image").attr('src', product.image.url);
    card.find("#product-price").text("R$ " + moneyMask(product.price.toFixed(2)));
    card.find("button[name='addProduct']").on('click', () => {
      addProductToCart(product.id);
      card.find("button[name='addProduct']").removeClass('btn-success');
      card.find("button[name='addProduct']").addClass('btn-secondary');
    });
    return card;
  }
  
  function getFilters(checkPrice = false) {
    let title, minPrice = 0, maxPrice = Number.MAX_SAFE_INTEGER, brands = [], ram = [], monitor = [], storage = [], os = []

    // Title
    title = new URL(window.location).searchParams.get('descricao') || '';
    title = title.trim().toLowerCase();

    // Price
    if (checkPrice) {
      minPrice = $('#products-filter [name=minimum-price]').val() || minPrice
      maxPrice = $('#products-filter [name=maximum-price]').val() || maxPrice
    }

    // Brands
    $('[id^=brand]').each((i, e) => {
      if (e.checked) brands.push($(e).val());
    });

    // RAM
    $('#products-filter [id^=ram]').each((i, e) => {
      if (e.checked) ram.push($(e).val() !== 'others' ? Number($(e).val().replace('gb', '')) : 'others');
    });

    // Monitor
    $('#products-filter [id^=monitor]').each((i, e) => {
      if (e.checked) monitor.push({ min: $(e).val().split('-')[0], max: $(e).val().split('-')[1] });
    });

    // Storage
    $('#products-filter [id^=storage]').each((i, e) => {
      if (e.checked) storage.push($(e).val().split('-')[1]);
    });

    // OS
    $('#products-filter [id^=os]').each((i, e) => {
      if (e.checked) os.push($(e).val().split('-')[1]);
    });

    return { title, minPrice, maxPrice, brands, ram, monitor, storage, os }
  }

  function meetFilterRequirements(filters, product) {
    return (!filters.title || product.title.toLowerCase().includes(filters.title)) && 
      product.price >= filters.minPrice &&
      product.price <= filters.maxPrice &&
      (filters.brands.length === 0 || filters.brands.includes(product.brand.name.toLowerCase())) &&
      (filters.ram.length === 0 || (filters.ram.includes(product.ram) || filters.ram.includes('others'))) &&
      (filters.monitor.length === 0 || 
        filters.monitor.some(m => m.min <= Number(product.monitor) && m.max >= Number(product.monitor))) &&
      (filters.storage.length === 0 || filters.storage.some(s => product[s] !== -1)) &&
      (filters.os.length === 0 || filters.os.includes(product.os.toLowerCase()));
  }

  function filterProducts(checkPrice = false) {
    $('#products-row').html('');

    const filters = getFilters(checkPrice);
    console.log('filters:', filters)
    
    products.forEach(product => {
      if (meetFilterRequirements(filters, product))
        $('#products-row').append(createProductCard(product));
    });

    // No products found
    if ($('#products-row').is(':empty')) {
      $('#products-row').append($('#no-products-message').html());
    }
  }

  // **************************************************************************************

  /*
    On ready calls
  */

  // Assign filter calls
  $('#products-filter .btn-primary').click(() => { filterProducts(true) })
  $('#products-filter .btn-secondary').click(() => {
    $('#products-filter [name=minimum-price]').val('');
    $('#products-filter [name=maximum-price]').val('');
    filterProducts();
  })
  $('#products-filter input[type=checkbox]').change(() => { filterProducts() });
  $('#products-filter [name=minimum-price]').change(() => {
    const minPrice = Number($('#products-filter [name=minimum-price]').val()) || 0
    const maxPrice = Number($('#products-filter [name=maximum-price]').val()) || 0
    $('#products-filter [name=maximum-price]').attr('min', minPrice + 50);
    if (minPrice > maxPrice - 100) {
      $('#products-filter [name=maximum-price]').val(minPrice + 500);
    }
  })

  let searchTitle = new URL(window.location).searchParams.get('descricao');
  if (searchTitle && searchTitle.trim()) {
    $('#form-header-search input').val(searchTitle)
  }

  // Load products
  $.ajax({
    url: '/note-commerce/shop/products?operation=consult',
    type: 'GET',
    dataType: 'json',
    success: function (json) {
      products = json;
      console.log('products:', products)
      filterProducts();
    }
  });
})