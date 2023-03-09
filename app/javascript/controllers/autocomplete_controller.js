const cameraModels = [
  "Canon EOS C70",
  "Canon EOS C300 Mark III",
  "Canon EOS C200",
  "Canon EOS C100 Mark II",
  "Canon EOS R",
  "Canon Vixia HF G21",
  "Canon Vixia HF G50",
  "Canon Vixia HF GX10",
  "Canon Vixia HF R800",
  "Canon Vixia HF R82",
  "Canon XA11",
  "Canon XA15",
  "Canon XA20",
  "Canon XA25",
  "Canon XA50",
  "Canon XA55",
  "Canon XF405",
  "Canon XF705",
  "Canon XF305",
  "Sony a7 III",
  "Nikon Z7 II",
  "Fujifilm X-T4",
  "Leica Q2",
  "Olympus OM-D E-M1X",
  "Pentax K-1 Mark II",
  "Panasonic AG-AC130",
  "Panasonic AG-AC160",
  "Panasonic AG-HPX170",
  "Panasonic AG-HPX500",
  "Panasonic AG-HSC1",
  "Panasonic AG-AF100",
  "Panasonic AG-HPX370",
  "Panasonic AG-HPX300",
  "Panasonic AG-HMC40",
  "Panasonic AG-HPX600",
  "Panasonic AG-PX800",
  "Panasonic AG-DVX200",
  "Panasonic HC-WXF990M",
  "Panasonic HCX-1000",
  "Panasonic HC-X2, HC-X20",
  "Panasonic HVX-200",
  "Panasonic Lumix S1R",
  "Sony HDR-FX7",
  "Sony HDR-HC7",
  "Sony HDR-CX7",
  "Sony HDR-HC7",
  "Sony HDR-HC7",
  "Sony HDR-SR1",
  "Sony HDR-CX12",
  "Sony HDR-CX500V",
  "Sony HVR-Z1",
  "Sony HVR-Z5",
  "Sony HDR-GW",
  "Sony VX2000/PD150",
  "Sony VX2100/PD170",
];

const searchInput = document.querySelector(".search-bar input[type='text']");
const searchButton = document.querySelector(".search-bar button");
const autocompleteDiv = document.querySelector(".autocomplete");

searchInput.addEventListener("keyup", () => {
  const searchTerm = searchInput.value.toLowerCase();
  const matchedCameraModels = cameraModels.filter((model) =>
    model.toLowerCase().includes(searchTerm)
  );
  const html = matchedCameraModels
    .map(
      (model) =>
        `<div class="autocomplete-item">${model}</div>`
    )
    .join("");
  autocompleteDiv.innerHTML = html;
});

searchInput.addEventListener("focusout", () => {
  autocompleteDiv.innerHTML = "";
});

searchButton.addEventListener("click", () => {
  const searchTerm = searchInput.value.toLowerCase();
  // Code to display search results
});
