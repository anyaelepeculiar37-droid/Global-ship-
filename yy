
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GlobalShip | Track Shipment</title>

<style>
* { box-sizing: border-box; }

body {
  margin: 0;
  font-family: Arial, sans-serif;
  background: #f2f5fa;
  color: #172b4d;
}

header {
  background: white;
  padding: 20px 6%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  gap: 15px;
  box-shadow: 0 2px 8px #0001;
}

.logo {
  color: #0878ed;
  font-size: 24px;
  font-weight: bold;
}

nav a {
  text-decoration: none;
  color: #253957;
  margin-left: 18px;
  font-size: 14px;
}

.hero {
  background: linear-gradient(120deg, #071e43, #086bc5);
  color: white;
  text-align: center;
  padding: 48px 20px;
}

.hero h1 { margin-top: 0; font-size: 34px; }
.hero p { line-height: 1.6; }

.search {
  display: flex;
  max-width: 570px;
  margin: 25px auto 0;
  gap: 8px;
}

.search input {
  flex: 1;
  min-width: 0;
  padding: 15px;
  border: 0;
  border-radius: 6px;
  font-size: 15px;
}

button {
  border: 0;
  background: #0878ed;
  color: white;
  border-radius: 6px;
  padding: 14px 20px;
  font-weight: bold;
  cursor: pointer;
}

.search button { background: #1688ff; }

main {
  max-width: 900px;
  margin: 30px auto;
  padding: 0 18px;
}

.card {
  background: white;
  border-radius: 12px;
  padding: 25px;
  margin-bottom: 20px;
  box-shadow: 0 3px 15px #1427470c;
}

.hidden { display: none; }

.status {
  display: inline-block;
  background: #fff0ce;
  color: #895600;
  padding: 8px 12px;
  border-radius: 20px;
  font-size: 13px;
  font-weight: bold;
}

.details {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 22px 25px;
  margin-top: 25px;
}

.label {
  color: #6b7b91;
  font-size: 12px;
  text-transform: uppercase;
  margin-bottom: 7px;
}

.value {
  font-weight: bold;
  line-height: 1.6;
  overflow-wrap: anywhere;
}

.divider {
  border: 0;
  border-top: 1px solid #e4eaf2;
  margin: 22px 0;
}

.timeline {
  margin-top: 25px;
  border-left: 3px solid #dbe6f3;
  padding-left: 20px;
}

.step {
  position: relative;
  padding-bottom: 25px;
}

.step::before {
  content: "";
  position: absolute;
  left: -27px;
  top: 2px;
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background: #0878ed;
}

.step p {
  color: #6b7b91;
  font-size: 13px;
  margin-bottom: 0;
}

.error {
  background: #fff0f0;
  color: #a52222;
  padding: 14px;
  border-radius: 7px;
  margin-top: 18px;
}

footer {
  background: #071e43;
  color: white;
  text-align: center;
  padding: 28px 15px;
  line-height: 1.8;
  font-size: 13px;
}

@media(max-width: 560px) {
  header { align-items: flex-start; flex-direction: column; }
  nav a { margin: 0 12px 0 0; }
  .search { flex-direction: column; }
  .details { grid-template-columns: 1fr; }
  .hero h1 { font-size: 28px; }
  .card { padding: 18px; }
}
</style>
</head>

<body>

<header>
  <div class="logo">🌐 GlobalShip</div>
  <nav>
    <a href="#home">Home</a>
    <a href="#track">Track Package</a>
    <a href="#services">Services</a>
  </nav>
</header>

<section class="hero" id="home">
  <h1>Track Your Shipment</h1>
  <p>Enter your tracking number to view your shipment information.</p>

  <form class="search" id="trackingForm">
    <input
      id="trackingNumber"
      type="text"
      placeholder="Enter tracking number"
      aria-label="Tracking number"
      required
    >
    <button type="submit">Track Package →</button>
  </form>
</section>

<main id="track">

  
<div class="card" id="welcome">
  <h2>Welcome to GlobalShip Tracking</h2>

  <p>
    Track your shipment with ease. Enter your unique
    tracking number above to view available shipment
    details, receiver information, and delivery updates.
  </p>

  <hr class="divider">

  <h3>How to track your shipment</h3>

  <p>1. Enter the tracking number provided to you.</p>
  <p>2. Click the <strong>Track Package</strong> button.</p>
  <p>3. View the shipment information associated with your code.</p>

  <p style="margin-top:20px;color:#68788e;font-size:13px">
    Need assistance? Please contact customer support.
  </p>
</div>


  <div id="error" class="error hidden" role="alert">
    No matching shipment was found. Check the tracking number and try again.
  </div>

  <section id="result" class="hidden">

    <div class="card">
      <div class="label">Tracking number</div>
      <h2 id="trackingDisplay"></h2>
      <span class="status" id="statusDisplay"></span>
      <hr class="divider">

      <div class="details">
        <div>
          <div class="label">Origin</div>
          <div class="value" id="origin"></div>
        </div>
        <div>
          <div class="label">Destination</div>
          <div class="value" id="destination"></div>
        </div>
        <div>
          <div class="label">Date shipped</div>
          <div class="value" id="shipDate"></div>
        </div>
        <div>
          <div class="label">Estimated delivery</div>
          <div class="value" id="deliveryDate"></div>
        </div>
      </div>
    </div>

    <div class="card">
      <h2>Receiver Information</h2>
      <div class="details">
        <div>
          <div class="label">Receiver's full name</div>
          <div class="value" id="receiver"></div>
        </div>
        <div>
          <div class="label">Phone number</div>
          <div class="value" id="phone"></div>
        </div>
        <div style="grid-column:1/-1">
          <div class="label">Delivery address</div>
          <div class="value" id="address"></div>
        </div>
      </div>
    </div>

    <div class="card">
      <h2>Shipment Progress</h2>
      <div class="timeline" id="timeline"></div>
    </div>

    <p style="font-size:12px;color:#68788e;text-align:center">
      Demonstration only. Shipment details and progress are sample data,
      not live carrier records.
    </p>

  </section>
</main>

<footer id="services">
  <strong>GlobalShip</strong><br>
  Fast. Safe. Worldwide.<br>
  Sample tracking website · 2026
</footer>

<script>
const shipments = {
  "GS20261015": {
    receiver: "Fera Febriana Rahmawati",
    phone: "+089618774072",
    address: "dusun bogor kerep Rt 02/Rw 03, desa Sukolilo, kecamatan bancar, kabupaten Tuban Jawa Timur",
    origin: "Amsterdam, Netherlands",
    destination: "Netherland,",
    shipDate: "15 October 2026",
    deliveryDate: "16th October 2026",
    status: "Sample shipment",
    events: [
      { title: "Shipment information created",
        date: "15 October 2026" },
      { title: "✅In transit",
        date: "Awaiting verified update" },
      { title: "Out for delivery",
        date: "Pending" },
      { title: "Delivered",
        date: "Pending" }
    ]
  }
};

const form = document.getElementById("trackingForm");

form.addEventListener("submit", function(event) {
  event.preventDefault();

  const code = document.getElementById("trackingNumber")
    .value.trim().toUpperCase();

  const shipment = shipments[code];

  document.getElementById("welcome").classList.add("hidden");
  document.getElementById("result").classList.add("hidden");
  document.getElementById("error").classList.add("hidden");

  if (!shipment) {
    document.getElementById("error").classList.remove("hidden");
    return;
  }

  const fields = {
    trackingDisplay: code,
    statusDisplay: shipment.status,
    receiver: shipment.receiver,
    phone: shipment.phone,
    address: shipment.address,
    origin: shipment.origin,
    destination: shipment.destination,
    shipDate: shipment.shipDate,
    deliveryDate: shipment.deliveryDate
  };

  Object.entries(fields).forEach(([id, value]) => {
    document.getElementById(id).textContent = value;
  });

  const timeline = document.getElementById("timeline");
  timeline.replaceChildren();

  shipment.events.forEach(item => {
    const step = document.createElement("div");
    step.className = "step";

    const title = document.createElement("strong");
    title.textContent = item.title;

    const date = document.createElement("p");
    date.textContent = item.date;

    step.append(title, date);
    timeline.appendChild(step);
  });

  document.getElementById("result").classList.remove("hidden");
  document.getElementById("track").scrollIntoView({
    behavior: "smooth"
  });
});
</script>

</body>
</html>

