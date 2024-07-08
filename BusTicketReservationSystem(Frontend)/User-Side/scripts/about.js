const moving_bus = document.querySelector('#moving-bus');
let baseURL = `http://localhost:8088`;
////////////////////
//custome alert
function openCustomAlert(message) {
  const customAlert = document.getElementById('customAlert');
  const customAlertMessage = document.getElementById('customAlertMessage');

  customAlertMessage.textContent = message;
  customAlert.style.display = 'block';
  setTimeout(() => {
      closeCustomAlert();
      window.location.href="../index.html";
  }, 3000)
}

function closeCustomAlert() {
  const customAlert = document.getElementById('customAlert');
  customAlert.style.display = 'none';
}

// function toggleStickyNavbar() {
//   if (window.scrollY > navbar.offsetTop) {
//   moving_bus.classList.add('moving-bus-sticky');
//   } else {
//   moving_bus.classList.remove('moving-bus-sticky');
//   }
// }


window.addEventListener('scroll', toggleStickyNavbar);


let account = document.getElementById("account");
let profileImg = document.getElementById("profileImg");
let account_dropDown = document.getElementById("account_dropDown");
let logout = document.getElementById("logout");
let username = JSON.parse(localStorage.getItem("username")) || "";
console.log(username);
if (username === "") {
  account.innerText = "LogIn"
  account.style="border-radius: 5px; padding: 4px; background-color: #1a61ae;color: white;";
  profileImg.style.display = "none";
  account_dropDown.style.display = "none";
  logout.style.display = "none";
} else {
  account.innerText = username.split(" ")[0].toUpperCase();
  account.setAttribute("href", "")
}

function logoutUser() {
  let uuid = JSON.parse(localStorage.getItem("uuid"))||"";
  if(uuid==""){
    openCustomAlert("Please Login First");
  }else{
    let url = `${baseURL}/user/logout?key=${uuid}`;
    console.log(uuid);
    fetch(url, {
        method: 'POST'
      })
      .then(response => response)
      .then(data => {
        openCustomAlert("User LogOut SucessFull!!");
        localStorage.setItem("username", JSON.stringify(""));
        localStorage.setItem("uuid", JSON.stringify(""));
        window.location.reload();
        console.log(data);
      })
      .catch(error => {
        console.error('Error posting data:', error);
      });
  }
 
}


