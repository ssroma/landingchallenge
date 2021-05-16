
// After Loading we get all the checkbox 
// keep track of the number os checkbox is check 
// in case we have more than 2 checked we prevent others to be clicked
// and add a link passing the two id's selected to be compared.
const CheckBox = function(){
    document.addEventListener("turbolinks:load", () => {
        removeLink();
        const checkBoxes = document.querySelectorAll(".selectCheckbox");
        let max = 2;
        for(let i = 0; i < checkBoxes.length; i++ ){
            checkBoxes[i].checked = false;
            checkBoxes[i].addEventListener('click', (event) => {
                selectiveCheck(event)
            });
        }
    
        function selectiveCheck (event) {
            let checkBoxChecked = document.querySelectorAll(".selectCheckbox:checked");
            if (checkBoxChecked.length == max ){
                createLisk(checkBoxChecked);
            }else if (checkBoxChecked.length >= max + 1){
                event.preventDefault();
            }else{
                removeLink();
            }
        }
    
        function createLisk(checkList){
            let userId = [];
            for(let i = 0; i < checkList.length; i++ ){
                let id = checkList[i].getAttribute('id');
                userId.push(id);
            }
            let linkPosition = checkList.length - 1;
            let position = checkList[linkPosition].parentNode;
            let a = document.createElement('a');
            a.innerHTML= "Compare"
            a.classList.add('button')
            a.classList.add('is-info')
            a.classList.add('compareLink')
            a.setAttribute('href', `/compare?leftUser=${userId[0]}&rightUser=${userId[1]}`);
            position.appendChild(a);
        }
    
        function removeLink(){
            let checkBoxUnChecked = document.querySelectorAll('input[type="checkbox"]:not(:checked)');
            for(let i = 0; i < checkBoxUnChecked.length; i++ ){
                let link = checkBoxUnChecked[i].parentNode.querySelector('.compareLink');
                if( link != null ){
                    checkBoxUnChecked[i].parentNode.removeChild(link);
                }
            }
            let checkBoxChecked = document.querySelectorAll(".selectCheckbox:checked");
            if(checkBoxChecked.length == 1){
                let checkedLink = checkBoxChecked[0].parentNode.querySelector('.compareLink');
                    if(checkedLink){
                        checkBoxChecked[0].parentNode.removeChild(checkedLink);
                    }
            }  
        }
    
    })
    }
    
    export default CheckBox;
    