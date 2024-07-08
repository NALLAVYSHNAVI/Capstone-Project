// Define your UUID and baseURL
let uuid = JSON.parse(localStorage.getItem("uuid")) || "";
let baseURL = `http://localhost:8088`;

// Function to fetch and display data
async function getData() {
  try {
    let res = await fetch(`${baseURL}/reservation/viewall?key=${uuid}`);
    if (!res.ok) {
      throw new Error(`HTTP error! status: ${res.status}`);
    }
    let data = await res.json();
    display(data);
  } catch (error) {
    console.error('Error fetching data:', error);
  }
}

// Function to display data in the HTML table
function display(data) {
  console.log(data);
  let tbody = document.getElementById("Tbody");
  if (!tbody) {
    console.error('Element with ID "tbody" not found.');
    return;
  }
  tbody.innerHTML = ""; // Clear existing data

  data.forEach((item) => {
    let row = document.createElement("tr");
    row.innerHTML = `
      <td>${item.reservationId}</td>
      <td>${item.destination}</td>
      <td>${item.reservationDate}</td>
      <td>${item.reservationStatus}</td>
      <td>${item.reservationTime}</td>
      <td>${item.reservationType}</td>
      <td>${item.source}</td>
      <td>${item.user.userName}</td>
      <td>${item.bus.busId}</td>
      <td>${item.bus.busName}</td>
    `;
    tbody.appendChild(row);
  });
}

// Call the getData function after the DOM has loaded
document.addEventListener("DOMContentLoaded", function () {
  getData();
});
//logout function
document.addEventListener("DOMContentLoaded", function () {
  // Add event listener to the "Logout" link
  var logoutLink = document.getElementById("logout");
  logoutLink.addEventListener("click", function (event) {
    event.preventDefault(); // Prevent the default link behavior
    Swal.fire({
      title: "Logout Confirmation",
      text: "Are you sure you want to logout?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "Logout",
      cancelButtonText: "Cancel",
      confirmButtonColor: "#d33",
      cancelButtonColor: "#3085d6",
    }).then((result) => {
      if (result.isConfirmed) {
        // Handle the logout action here (replace with your actual logout logic)
        Swal.fire({
          title: "Logged Out!",
          text: "You have been successfully logged out.",
          icon: "success",
          confirmButtonColor: "#3085d6",
        }).then(() => {
          // Redirect to the login page or any other designated page for logging out
          let url = `${baseURL}/admin/logout?key=${uuid}`;
          console.log(uuid);
          fetch(url, {
              method: 'POST'
            })
            .then(response => response)
            .then(data => {
              // openCustomAlert("User LogOut SucessFull!!");
              localStorage.setItem("username", JSON.stringify(""));
              localStorage.setItem("uuid", JSON.stringify(""));
            
              console.log(data);
            })
            .catch(error => {
              console.error('Error posting data:', error);
            });
          window.location.href = "../index.html"; // Replace "login.html" with the actual logout page URL
        });
      }
    });
  });
});