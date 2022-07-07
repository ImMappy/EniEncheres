function searchBar() {
    // Declare variables
    let input = document.getElementById('searchBarInput');
    input = input.value.toLowerCase();
    let x = document.getElementsByClassName('articleSearch');

    // Loop through all list items, and hide those who don't match the search query
    for (let i = 0; i < x.length; i++) {
        if (!x[i].innerHTML.toLowerCase().includes(input)) {
            x[i].style.display="none";
            x[i].style.listStyle="none";
        }
        else {
            x[i].style.display="list-item";
            x[i].style.listStyle="none";
        }
    }
}

function searchSelect() {
    // Declare variables
    let select = document.getElementById('categorySelect');
    select = select.value.toLowerCase();
    let y = document.getElementsByClassName('articleSearch');

    // Loop through all list items, and hide those who don't match the search query
    for (let i = 0; i < x.length; i++) {
        if (!y[i].innerHTML.toLowerCase().includes(select)) {
            y[i].style.display="none";
            y[i].style.listStyle="none";
        }
        else {
            y[i].style.display="list-item";
            y[i].style.listStyle="none";
        }
    }
}