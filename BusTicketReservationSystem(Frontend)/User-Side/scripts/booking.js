// Define your UUID and baseURL
let uuid = JSON.parse(localStorage.getItem("uuid")) || "";
let baseURL = `http://localhost:8088`;
const userID = JSON.parse(localStorage.getItem('userid'));

// Function to fetch and display data
// async function getData() {
//   try {
//     let res = await fetch(`${baseURL}/reservation/viewall?key=${uuid}`);
//
//     if (!res.ok) {
//       throw new Error(`HTTP error! status: ${res.status}`);
//     }
//     let data = await res.json();
//     console.log(data);
//     display(data);
//   } catch (error) {
//     console.error('Error fetching data:', error);
//   }
// }

async function getData() {
  try {
    let res = await fetch(`${baseURL}/reservation/viewall?key=${uuid}`);
    if (!res.ok) {
      throw new Error(`HTTP error! status: ${res.status}`);
    }
    let data = await res.json();
    // Filter data by userId
    console.log(data);

    let filteredData = data.filter(item => item.user.userLoginId === userID);


    console.log(filteredData);
    display(filteredData);
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
<!--      <td>${item.bus.busId}</td>-->
      <td>${item.bus.busName}</td>
    `;
    tbody.appendChild(row);
  });
}

// Call the getData function after the DOM has loaded
document.addEventListener("DOMContentLoaded", function () {
  getData();
});
