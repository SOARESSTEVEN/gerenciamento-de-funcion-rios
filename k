const funcionarios = [];

    const btnOpenModal = document.getElementById("butao");
    const modalWrapper = document.getElementById('paiModal');
    const btnCloseModal = document.getElementById("cancelbtn");
    const submitBtn = document.getElementById("submitbtn");
    const employeeList = document.getElementById("employeeList");
    const employeeDetailsSpan = document.getElementById("employeeDetailsSpan");

    // Abre o modal
    btnOpenModal.onclick = () => {
        modalWrapper.style.display = "flex";
    };

    // Fecha o modal
    btnCloseModal.onclick = () => {
        modalWrapper.style.display = "none";
    };

    // Função para mostrar detalhes do funcionário
    function showEmployeeDetails(employee) {
        employeeDetailsSpan.innerHTML = `
            <strong>Nome:</strong> ${employee.name} <br>
            <strong>Sobrenome:</strong> ${employee.surname} <br>
            <strong>Idade:</strong> ${employee.age} <br>
            <strong>Email:</strong> ${employee.email} <br>
            <strong>Telefone:</strong> ${employee.number}
        `;
    }

    // Função para criar um elemento de funcionário
    function createEmployeeElement(employee) {
        const employeeItem = document.createElement("span");
        const deleteButton = document.createElement("button");

        deleteButton.textContent = "x";
        employeeItem.textContent = employee.name;
        employeeItem.classList.add("employee-item");
        deleteButton.classList.add("delete-button");

        // Exibe detalhes do funcionário ao clicar no nome
        employeeItem.onclick = function () {
            showEmployeeDetails(employee);
        };

        // Remove o funcionário da lista ao clicar no botão de exclusão
        deleteButton.onclick = function () {
            removeEmployee(employeeItem, employee);
        };

        employeeItem.appendChild(deleteButton);
        return employeeItem;
    }

    // Função para adicionar um funcionário à lista no DOM
    function addEmployeeToDOM(employee) {
        const employeeElement = createEmployeeElement(employee);
        employeeList.appendChild(employeeElement);
    }

    // Função para remover um funcionário da lista
    function removeEmployee(employeeElement, employee) {
        employeeList.removeChild(employeeElement);

        // Remove o funcionário da lista de funcionários
        const index = funcionarios.indexOf(employee);
        if (index > -1) {
            funcionarios.splice(index, 1);
        }
    }

    // Função para adicionar um novo funcionário
    function addWorker() {
        const name = document.getElementById("name").value;
        const surname = document.getElementById("surname").value;
        const age = parseInt(document.getElementById("idade").value, 10);
        const number = document.getElementById("telefone").value;
        const email = document.getElementById("email").value;

        if (name && surname && !isNaN(age) && number && email) {
            const newEmployee = {
                name: name,
                surname: surname,
                age: age,
                email: email,
                number: number
            };

            funcionarios.push(newEmployee);
            addEmployeeToDOM(newEmployee);

            // Limpa o formulário e fecha o modal
            document.getElementById("employeeForm").reset();
            modalWrapper.style.display = "none";
        }
    }

    // Adiciona evento para o botão de adicionar funcionário
    submitBtn.onclick = addWorker;