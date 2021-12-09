window.onload=function(){
    if(document.getElementById("teamSelector")) {

        teamSelector = document.getElementById("teamSelector");
        
        teamSelector.addEventListener('change', update)
        
        function update(e) {
            team = document.getElementById("scrim_team");
            team.value = teamSelector.value;
        }
    }

    if(document.getElementById("teamInput")) {
        teamInput = document.getElementById("teamInput")
        
        teamInput.addEventListener('keydown', update)
        
        function update(e) {
            teamOutputsDivs = document.querySelectorAll('div.container-padrao.container-equipes');
            teamOutputsLis = document.querySelectorAll('li');
            var index = 0;
            teamOutputsLis.forEach(li => {
                if(teamInput.value == '') {
                    teamOutputsDivs[index].classList.remove("d-none")
                }
                if(!li.innerText.includes(teamInput.value)) {
                    teamOutputsDivs[index].classList.add("d-none")
                }
                index++;
            });
        }
    }
}