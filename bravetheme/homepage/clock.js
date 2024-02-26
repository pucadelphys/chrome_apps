const options = {weekday:'short', month:'short', day:'2-digit', year:'numeric', hour:'2-digit', minute:'2-digit', hour12:false}

function getTime() {
    const date = new Date().toLocaleDateString("en-US", options);
    document.getElementById("time").textContent = date;
}

getTime()
setInterval(getTime, 30000 )
