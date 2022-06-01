'use strict';

const output = document.getElementById('output');

document.getElementById('kittenForm').addEventListener("submit", function (event) {
    event.preventDefault();

    // console.log(this);
    const form = event.target;

    const kitten = {
        name: form.kittenName.value,
        age: form.kittenAge.value,
        breed: form.kittenBreed.value,
        cuteness: form.kittenCuteness.value
    }

    axios.post("http://localhost:4494/kitten/create", kitten)
        .then(res => {
            console.log("RESPONSE: ", res);
            renderKittens();
        })
        .catch(err => console.error(err));

    console.log("kitten: ", kitten);
});

function renderKittens() {
    axios.get("http://localhost:4494/kitten/getAll")
        .then(res => {
            output.innerHTML = "";
            for (let kitten of res.data) {
                const kittenDiv = document.createElement("div");

                const kittenName = document.createElement("h2");
                kittenName.innerText = kitten.name;
                kittenDiv.appendChild(kittenName);

                output.prepend(kittenDiv);
            

            const kittenDelete = document.createElement("button");
            kittenDelete.innerText = "Bop";
            kittenDelete.addEventListener("click", function () { 
                delKitten(kitten.id);

                kittenDiv.appendChild(kittenDelete);

                output.appendChild(kittenCol);
            });

            kittenDiv.appendChild(kittenDelete);

            output.appendChild(kittenCol);
          }
 
        })
        .catch(err => console.error(err));
}



    function delKitten(id) {
        axios.delete("http://localhost:4494/kitten/remove/" + id)
        .then(resolution => {
            console.log(res);
            renderKittens();
        })

        .catch(err => console.error(err));
    }

renderKittens();