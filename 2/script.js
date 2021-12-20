let currentTab = 0;
showTab(currentTab);

function showTab(n) {
  let x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == x.length - 1) {
    document.getElementById("end").innerHTML = "Завершить";
  } else {
    document.getElementById("nextBtn").innerHTML = "Далее";
  }
  if (n == x.length - 1) {
    document.getElementById("nextBtn").style.display = "inline";
  }
  if (currentTab == 2)
    document.getElementById("nextBtn").style.display = "none";
  else {
    document.getElementById("nextBtn").style.display = "inline";
  }
}

function nextPrev(n) {
  let x = document.getElementsByClassName("tab");
  if (n == 1 && !validateForm()) return false;
  x[currentTab].style.display = "none";
  currentTab = currentTab + n;
  if (currentTab >= x.length) {
    document.getElementById("regForm").submit();
    return false;
  }
  showTab(currentTab);
}

function validateForm() {
  let x,
    y,
    i,
    valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  for (i = 0; i < y.length; i++) {
    if (y[i].value == "") {
      validateEmail(y[i].innerHTML);
      document.getElementById("validate").style.display = "inline";
      valid = false;
    }
  }
  return valid;
}

function validate(regForm, email) {
  let reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
  let address = document.forms[regForm].elements[email].value;
  if (reg.test(address) == false) {
    alert("Введите корректный e-mail");
    return false;
  } else {
    alert("Спасибо");
  }
}
