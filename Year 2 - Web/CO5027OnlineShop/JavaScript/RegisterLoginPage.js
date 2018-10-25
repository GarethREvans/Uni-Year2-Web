
function PageLoad() {
    document.getElementsByClassName("btnAccountTab1")[0].style.display = "none"
    document.getElementsByClassName("btnAccountTab2")[0].style.display = "none"
}

function login_tab_Click() {

    document.getElementsByClassName("panelAccountForm")[1].style.display = "none";
    document.getElementsByClassName("panelAccountForm")[0].style.display = "block";
    document.getElementsByClassName("accountTab")[0].style.backgroundColor = "#FF5722";
    document.getElementsByClassName("accountTab")[0].style.color = "#FFFFFF";
    document.getElementsByClassName("accountTab")[1].style.backgroundColor = "#CFD8DC";
    document.getElementsByClassName("accountTab")[1].style.color = "#FF5722";
    for (var i = 2; i < 5; i++) {
        document.getElementsByClassName("formInput")[i].value = "";
    }
}

function register_tab_Click() {

    document.getElementsByClassName("panelAccountForm")[0].style.display = "none";
    document.getElementsByClassName("panelAccountForm")[1].style.display = "block";
    document.getElementsByClassName("accountTab")[1].style.backgroundColor = "#FF5722";
    document.getElementsByClassName("accountTab")[1].style.color = "#FFFFFF";
    document.getElementsByClassName("accountTab")[0].style.backgroundColor = "#CFD8DC";
    document.getElementsByClassName("accountTab")[0].style.color = "#FF5722";
    for (var i = 0; i < 2; i++) {
        document.getElementsByClassName("formInput")[i].value = "";
    }
}

window.addEventListener("load", PageLoad());