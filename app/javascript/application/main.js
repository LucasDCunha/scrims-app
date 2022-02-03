window.addEventListener("wheel", function(e) {

    
    // HOME DROPDOWN
    if(document.getElementById("teamSelector")) {
        
        teamSelector = document.getElementById("teamSelector");
        
        teamSelector.addEventListener('change', update)
        
        function update(e) {
            team = document.getElementById("scrim_team");
            team.value = teamSelector.value;
            console.log(team.value)
        }
    }
    
    // SEARCH BAR
    if(document.getElementById("teamInput")) {
        teamInput = document.getElementById("teamInput")
        
        teamInput.addEventListener('keyup', update)
        
        function update(e) {
            teamOutputsDivs = document.querySelectorAll('div.container-padrao.container-equipes.container-busca-equipes.select');
            var index = 0;
            teamOutputsDivs.forEach(li => {
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
    
    // SEARCH DROPDOWN ENEMY
    if(document.getElementById("enemySelector")) {
        
        enemySelector = document.getElementById("enemySelector");
        
        enemySelector.addEventListener('change', update)
        
        function update(e) {
            team1 = document.getElementById("invite_team1");
            team1.value = enemySelector.value;
            console.log(team1.value);
        }
    }
    
    //SEARCH DROPDOWN MY TEAM
    if(document.getElementById("myTeamSelector")) {
        
        myTeamSelector = document.getElementById("myTeamSelector");
        
        myTeamSelector.addEventListener('change', update)
        
        function update(e) {
            team2 = document.getElementById("invite_team2");
            team2.value = myTeamSelector.value;
            console.log(team2.value);
        }
    }

    //TRANSFER TEAM SELECTOR
    if(document.getElementById("userSelector")) {
        myTeamSelectorTransfer = document.getElementById("myTeamSelectorTransfer");
        
        myTeamSelectorTransfer.addEventListener('change', update)
        
        function update(e) {
            team = document.getElementById("transf_info_team");
            team.value = myTeamSelectorTransfer.value;
            console.log(team.value);
        }
    }

    //TRANSFER USER SELECTOR
    if(document.getElementById("userSelector")) {
        userSelectorTransfer = document.getElementById("userSelector");
        
        userSelectorTransfer.addEventListener('change', update)
        
        function update(e) {
            user = document.getElementById("transf_info_user");
            user.value = userSelectorTransfer.value;
            console.log(user.value);
        }
    }

});

setTimeout(function () {document.getElementById('alert').style.display='none'}, 3000);
