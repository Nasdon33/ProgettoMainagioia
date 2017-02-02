function validate(id, name, url, price, address, cap, city, province, state) {
        $( '.hid' ).show();
        document.getElementById('rico').setAttribute("value", id);
        document.getElementById('nome').innerHTML = name;
        document.getElementById('n').innerHTML = name;
        document.getElementById('w').innerHTML = url;
        document.getElementById('p').innerHTML = price;
        document.getElementById('a').innerHTML = address;
        document.getElementById('cap').innerHTML = cap;
        document.getElementById('cit').innerHTML = city;
        document.getElementById('pro').innerHTML = province;
        document.getElementById('s').innerHTML = state;
    }