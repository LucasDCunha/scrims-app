window.onload=function(){
    if(document.getElementById("teamSelector")) {

        teamSelector = document.getElementById("teamSelector");
        
        teamSelector.addEventListener('change', update)
        
        function update(e) {
            team = document.getElementById("scrim_team");
            team.value = teamSelector.value;
        }
    }
}