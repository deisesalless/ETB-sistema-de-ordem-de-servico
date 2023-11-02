<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Clientes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"> <script src="https://kit.fontawesome.com/0102f89b01.js" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px;
        }

        h1 {
            margin: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .cliente-list {
            list-style: none;
            padding: 0;
        }

        .cliente-item {
            margin: 10px 0;
            cursor: pointer;
            display: flex;
            align-items: center;
        }

        .cliente-item:hover {
            text-decoration: underline;
        }

        .cliente-name {
            flex: 1;
        }

        .toggle-icon {
            cursor: pointer;
        }

        .veiculo-list {
            list-style: none;
            padding: 0;
            margin-left: 20px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Lista de Clientes</h1>
    </header>
    <div class="container">
        <ul class="cliente-list">
            <li class="cliente-item" onclick="toggleVeiculos('cliente1')">
                <span class="cliente-name">Cliente 1</span>
                <i id="cliente1-icon" class="toggle-icon fas fa-chevron-down"></i>
            </li>
            <div id="cliente1-veiculos" class="veiculo-list" style="display: none;">
                <li>Veículo 1</li>
                <li>Veículo 2</li>
            </div>
            <li class="cliente-item" onclick="toggleVeiculos('cliente2')">
                <span class="cliente-name">Cliente 2</span>
                <i id="cliente2-icon" class="toggle-icon fas fa-chevron-down"></i>
            </li>
            <div id="cliente2-veiculos" class="veiculo-list" style="display: none;">
                <li>Veículo 3</li>
                <li>Veículo 4</li>
            </div>
            <li class="cliente-item" onclick="toggleVeiculos('cliente3')">
                <span class="cliente-name">Cliente 3</span>
                <i id="cliente3-icon" class="toggle-icon fas fa-chevron-down"></i>
            </li>
            <div id="cliente3-veiculos" class="veiculo-list" style="display: none;">
                <li>Veículo 5</li>
                <li>Veículo 6</li>
            </div>
        </ul>
    </div>
    <script>
        function toggleVeiculos(clienteId) {
            const clienteVeiculos = document.getElementById(clienteId + '-veiculos');
            const toggleIcon = document.getElementById(clienteId + '-icon');

            if (clienteVeiculos.style.display === 'none') {
                clienteVeiculos.style.display = 'block';
                toggleIcon.classList.remove('fa-chevron-down');
                toggleIcon.classList.add('fa-chevron-up');
            } else {
                clienteVeiculos.style.display = 'none';
                toggleIcon.classList.remove('fa-chevron-up');
                toggleIcon.classList.add('fa-chevron-down');
            }
        }
    </script>
</body>
</html>
