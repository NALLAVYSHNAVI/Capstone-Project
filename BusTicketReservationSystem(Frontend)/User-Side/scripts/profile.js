// Define your UUID and baseURL globally
let uuid = JSON.parse(localStorage.getItem("uuid")) || "";
const currUser = JSON.parse(localStorage.getItem('uuid'));
let userid = JSON.parse(localStorage.getItem("userid")) || "";
let baseURL = `http://localhost:8088`;
let username = JSON.parse(localStorage.getItem('username'));
// Function to fetch data from the API
async function getData() {
  // try {
    let res = await fetch(`${baseURL}/user/view/${userid}?key=${uuid}`);
    if (res.status === 302) {
        let data = await res.json();
      // const newLocation = res.headers.get('Location');
      // res = await fetch(newLocation);
        console.log(data);

      // let data = {
      //   firstName: data.firstName,
      //   lastName: data.lastName,
      //   email: data.email,
      //   contact: data.contact,
      // };
      display(data);
    }else
    if (!res.ok) {
      throw new Error(`HTTP error! status: ${res.status}`);
      let data = {
        firstName: "John",
        lastName: "Doe",
        email: "john.doe@example.com",
        contact: "1234567890"
      };
      display(data);
    } else {
    let data = await res.json();
    display(data);
    }
  // } 
  // catch (error) {
  //   console.error('Error fetching data:', error); // Log the entire error object
  // }
}


function display(data) {
  let profileContainer = document.getElementById("card-block");
  if (!profileContainer) {
    console.error('Element with ID "profile-container" not found.');
    return;
  }
  profileContainer.innerHTML = ""; // Clear existing data

  // Create elements to display user profile information
  let profileHeading = document.createElement("h2");
  profileHeading.textContent = "User Profile";
  profileContainer.appendChild(profileHeading);

  let user = {
    firstName: data.firstName,
    lastName: data.lastName,
    email: data.email,
    contact: data.contact,

  };

  // Function to create label elements
  function createLabel(text) {
    let label = document.createElement("label");
    label.textContent = text;
    return label;
  }


    function createInput(type, value, id) {
        let input = document.createElement("input");
        input.type = type;
        input.value = value;
        input.id = id;
        input.disabled = true;
        return input;
    }

    let firstNameLabel = createLabel("First Name:");
    profileContainer.appendChild(firstNameLabel);
    let firstNameInput = createInput("text", user.firstName, "firstNameInput"); // Set the id here
    profileContainer.appendChild(firstNameInput);
    profileContainer.appendChild(document.createElement("br"));

    let lastNameLabel = createLabel("Last Name:");
    profileContainer.appendChild(lastNameLabel);
    let lastNameInput = createInput("text", user.lastName, "lastNameInput"); // Set the id here
    profileContainer.appendChild(lastNameInput);
    profileContainer.appendChild(document.createElement("br"));

    let emailLabel = createLabel("Email:");
    profileContainer.appendChild(emailLabel);
    let emailInput = createInput("email", user.email, "emailInput"); // Set the id here
    profileContainer.appendChild(emailInput);
    profileContainer.appendChild(document.createElement("br"));

    let phoneLabel = createLabel("Phone:");
    profileContainer.appendChild(phoneLabel);
    let phoneInput = createInput("tel", user.contact, "phoneInput"); // Set the id here
    profileContainer.appendChild(phoneInput);
    profileContainer.appendChild(document.createElement("br"));
}

// Call the getData function after the DOM has loaded
document.addEventListener("DOMContentLoaded", function () {
    getData();
    // display(data);

    document.getElementById("updateButton").addEventListener("click", function(event) {
        event.preventDefault();
        let userData = {
            userLoginId:  userid,
            firstName: document.getElementById("firstNameInput").value,
            lastName: document.getElementById("lastNameInput").value,
            email: document.getElementById("emailInput").value,
            contact: document.getElementById("phoneInput").value
        };
        console.log(userData);


        if (confirm("Are you sure you want to update?")) {


            const bookApi = `${baseURL}/user/update?key=${currUser}`;

            fetch(bookApi,{
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json', // Replace with the appropriate content type if needed
                },
                body: JSON.stringify(userData)
            })
                .then(response => response.json())
                .then(data => {
                    // Handle the API response data here
                    console.log(data);
                    alert("Profile Updated Successfully....!");
                    // window.location.href="../profile.html";
                    window.location.reload();
                })
                .catch(error => {
                    // Handle any errors that occur during the fetch
                    console.error('Error:', error);
                    alert(error.message());
                });
            // let xhr = new XMLHttpRequest();
            //
            // xhr.open("POST", `${baseURL}/user/update?key=${uuid}`); // set api url
            //
            // xhr.setRequestHeader("Content-Type", "application/json");
            // xhr.onload = function() {
            //     if (xhr.status === 200) {
            //         alert("Data updated successfully!");
            //     } else {
            //         alert("Failed to update data. Please try again.");
            //     }
            // };
            // xhr.send(JSON.stringify(userData));
        }
    });
});


