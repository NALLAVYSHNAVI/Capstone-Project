let bookHeading = document.getElementById('book-heading');
let searchTicketForm = document.getElementById('search-ticket-form');
let fetchedBusContainer = document.getElementById('fetched-bus-container');

const currUser = JSON.parse(localStorage.getItem('uuid'));
const currUserId = JSON.parse(localStorage.getItem('userid'));
let busDetails = [];

let baseURL = `http://localhost:8088`;

function createBusDiv(bus, departureDate){
    console.log(departureDate);

  let busDetailsContainer = document.createElement('div');
  busDetailsContainer.classList.add('bus-details-contaner');

  let travelClassDiv = document.createElement('div');
  travelClassDiv.classList.add('travels-name');

  let travelsName = document.createElement('h3');
  travelsName.innerText = bus.busName;

  let bustypep = document.createElement('p');
  bustypep.innerText = "Bus Type: " + bus.busType;

  travelClassDiv.appendChild(travelsName);
  travelClassDiv.appendChild(bustypep);

  let busTime = document.createElement('div');
  busTime.classList.add('bus-time');

  const table = document.createElement('table');
  table.id = 'bus-timing-table';
  
  const tableHead = document.createElement('thead');
  
  const headCell1 = document.createElement('th');
  headCell1.innerText = "Departure"

  const headCell2 = document.createElement('th');
  const headCell3 = document.createElement('th');
  headCell3.innerText = "Arrival";
  
  tableHead.appendChild(headCell1);
  tableHead.appendChild(headCell2);
  tableHead.appendChild(headCell3);
  
  const tableBody = document.createElement('tbody');
  
  const bodyRow1 = document.createElement('tr');

  const bodyCell1 = document.createElement('td');
  bodyCell1.innerText = bus.departureTime;

  const bodyCell2 = document.createElement('td');
  bodyCell2.innerHTML = `<i class="fa-solid fa-arrow-right"></i>`;

  const bodyCell3 = document.createElement('td');
  bodyCell3.innerText = bus.arrivalTime;
  
  bodyRow1.appendChild(bodyCell1);
  bodyRow1.appendChild(bodyCell2);
  bodyRow1.appendChild(bodyCell3);
  
  const bodyRow2 = document.createElement('tr');

  const bodyCell4 = document.createElement('td');
  bodyCell4.innerText = bus.routeFrom;

  const bodyCell5 = document.createElement('td');

  const bodyCell6 = document.createElement('td');
  bodyCell6.innerText = bus.routeTo;
  
  bodyRow2.appendChild(bodyCell4);
  bodyRow2.appendChild(bodyCell5);
  bodyRow2.appendChild(bodyCell6);
  
  tableBody.appendChild(bodyRow1);
  tableBody.appendChild(bodyRow2);
  
  table.appendChild(tableHead);
  table.appendChild(tableBody);

  busTime.appendChild(table);

  let ticketPriceDetails = document.createElement('div');
  ticketPriceDetails.classList.add('ticket-price-details');

  let ticketCharges = document.createElement('h2');
  ticketCharges.innerText = "Ticket charges : " + bus.ticketCharges;

  let currUsers = document.createElement('h2');
  currUsers.innerText = "User : " + currUserId;

  let availableSeatsh2 = document.createElement('h2');
  console.log(`CURR USER:${currUser} `);
  const reservationApi = `${baseURL}/reservation/viewall?key=${currUser}`;
  fetch(reservationApi)
      .then(response =>
          response.json())
      .then(reservations => {
        console.log("Reservation data:", reservations);

        // Ensure reservations is an array
        if (!Array.isArray(reservations)) {
          throw new Error('Reservation data is not in the expected format');
        }

        // Filter reservations based on reservationDate and busId
        const matchingReservations = reservations.filter(reservation => {
          console.log(`ReservDate:${reservation.reservationDate}`);
          console.log(`BusID:${reservation.bus.busId}`);
          return reservation.reservationDate === departureDate && reservation.bus.busId === bus.busId;
        });

        console.log(`MatchingReserations:${matchingReservations}`);
        console.log(`Length:${matchingReservations.length}`);

       let bookedSeatsCount = 0;
       if(matchingReservations == null){

       }else {
         // Calculate the number of booked seats
         bookedSeatsCount = matchingReservations.length;
         console.log(`BookedSeatsCount:${bookedSeatsCount} `);
       }
        // Ensure bus.availableSeats is properly defined
        if (typeof bus.availableSeats !== 'number') {
          throw new Error('Invalid availableSeats value for the bus');
        }

        console.log(`BusSeats:${bus.availableSeats}`);
        // Calculate the updated available seats count
        const updatedAvailableSeats = bus.availableSeats - bookedSeatsCount;

        if (updatedAvailableSeats <= 0) {

          availableSeatsh2.innerText = "Available Seats : 0";
          // Handle case when no seats are available
        } else {
          availableSeatsh2.innerText = "Available Seats: " + updatedAvailableSeats;
        }
      })
      .catch(error => {
        console.error('Error fetching reservation data:', error);
        availableSeatsh2.innerText = "Available Seats: Error fetching data";
      });

  console.log(`AVAILABLESEATSsh2:${availableSeatsh2}`);

  // let availableSeatsh2 = document.createElement('h2');
  // availableSeatsh2.innerText = "Available Seats: " + bus.availableSeats;

  let bookButton = document.createElement('button');
  bookButton.id = "book-ticket";
  bookButton.innerText = "Book";

  bookButton.addEventListener('click', () => {
    const currBus = bus.busId;
     console.log(`User:${currUser}`);
    if(`${currUser}` === '' || `${currUser}` === 'null' || `${currUser}` === null){
      window.location.href="./login.html";
       }
    else{
      const bookApi = `${baseURL}/reservation/add/${currBus}?key=${currUser}`;

      let bodyToSend = {
        reservationDate: departureDate,
        source: bus.routeFrom,
        destination: bus.routeTo
      };

      fetch(bookApi, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json', // Replace with the appropriate content type if needed
        },
        body: JSON.stringify(bodyToSend)
      })
          .then(response => response.json())
          .then(data => {
            // Handle the API response data here
            console.log(data);
            alert("Ticket Book Successfully....!\nYour Ticket Id is " + data.reservationId);
            window.location.href="../index.html";
          })
          .catch(error => {
            // Handle any errors that occur during the fetch
            console.error('Error:', error);
            alert(error.message());
          });

    }


      })

  ticketPriceDetails.appendChild(ticketCharges);
  // ticketPriceDetails.appendChild(currUsers);
  ticketPriceDetails.appendChild(availableSeatsh2);
  ticketPriceDetails.appendChild(bookButton);

  busDetailsContainer.appendChild(travelClassDiv);
  busDetailsContainer.appendChild(busTime);
  busDetailsContainer.appendChild(ticketPriceDetails);

  console.log(busDetailsContainer);
  return busDetailsContainer;
}


function createBusDetails(busDetails, departureDate){
  busDetails.forEach(e => {
    fetchedBusContainer.appendChild(createBusDiv(e, departureDate));
  })
}

function checkBusDetails(data, fromCity, toCity, departureDate){
  console.log(fromCity, toCity);
  data.forEach(element => {
    if(element.routeFrom.toLowerCase() == fromCity && element.routeTo.toLowerCase() == toCity){
      busDetails.push(element);
    }
  });
  if(busDetails.length == 0){
    alert("Dear Customer There Is No bus Available From " + fromCity + " to " + toCity);
    window.location.reload();
  }
  createBusDetails(busDetails, departureDate);
}

function displayBus(fromCity, toCity, departureDate){
  // if(currUser == null || currUser == ""){
  //   alert("Please Login to Check Available buses...!");
  //   window.location.href="./login.html";
  // }
  const fetchBusApi = `${baseURL}/Bus/viewAllBus?key=${currUser}`;
  fetch(fetchBusApi)
  .then(response =>response.json())
  .then(data => {
    console.log(data);
    bookHeading.style.display = "none";
    checkBusDetails(data, fromCity, toCity, departureDate);
  })
  .catch(error => {
    console.error('Error fetching bus details:', error);
  });
}

searchTicketForm.addEventListener('submit', (event) => {
    event.preventDefault();
    const fromCity = event.target[0].value.toLowerCase();
    const toCity = event.target[1].value.toLowerCase();
    const departureDate = event.target[2].value;
    fetchedBusContainer.innerHTML = null;
    busDetails = [];
    displayBus(fromCity, toCity, departureDate);
})

// function openCustomAlert(message) {
//   const customAlert = document.getElementById('customAlert');
//   const customAlertMessage = document.getElementById('customAlertMessage');

//   customAlertMessage.textContent = message;
//   customAlert.style.display = 'block';
//   setTimeout(() => {
//       closeCustomAlert();
//       window.location.href="../index.html";
//   }, 3000)
// }

// function closeCustomAlert() {
//   const customAlert = document.getElementById('customAlert');
//   customAlert.style.display = 'none';
// }

// function toggleStickyNavbar() {
//   if (window.scrollY > navbar.offsetTop) {
//   moving_bus.classList.add('moving-bus-sticky');
//   } else {
//   moving_bus.classList.remove('moving-bus-sticky');
//   }
// }


// window.addEventListener('scroll', toggleStickyNavbar);


let account = document.getElementById("account");
let profileImg = document.getElementById("profileImg");
let account_dropDown = document.getElementById("account_dropDown");
let logout = document.getElementById("logout");
let username = JSON.parse(localStorage.getItem("username")) || "";
if (username == "") {
  account.innerText = "LogIn"
  account.style="border-radius: 5px; padding: 4px; background-color: #1a61ae;color: white;";
  profileImg.style.display = "none";
  account_dropDown.style.display = "none";
  logout.style.display = "none";
  account.setAttribute("href", "./login.html")
} else {
  account.innerText = username.split(" ")[0].toUpperCase();
  account.setAttribute("href", "")
}

function logoutUser() {
  let uuids = JSON.parse(localStorage.getItem("uuid"))||"";
let user1 = JSON.parse(localStorage.getItem("username")) || "";
  console.log(uuids);
  console.log(user1);
  if(uuids==""){
    openCustomAlert("Please Login First");
  }else{
    let url = `${baseURL}/user/logout?key=${uuids}`;
    console.log(uuids);
    fetch(url, {
        method: 'POST'
      })
      .then(response => response)
      .then(data => {
        // openCustomAlert("User LogOut SucessFull!!");
        localStorage.setItem("username", JSON.stringify(""));
        localStorage.setItem("uuid", JSON.stringify(""));
        // window.location.href="../../index.html";
        window.location.reload();
        console.log(data);
      })
      .catch(error => {
        console.error('Error posting data:', error);
      });
  }
 
}