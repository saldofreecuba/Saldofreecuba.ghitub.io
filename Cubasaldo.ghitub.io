<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comprar Saldo Seguro | CUBAMAXTRAVEL</title>
    <!-- Carga de Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Fuente principal Inter y fondo oscuro */
        body {
            font-family: 'Inter', sans-serif;
            /* Usamos un degradado para mantener el fondo profesional y oscuro */
            background: linear-gradient(135deg, #001f3f 0%, #004d80 100%); 
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            position: relative;
            display: flex;
            flex-direction: column; 
            justify-content: flex-start;
            align-items: center;
            min-height: 100vh;
            padding: 20px 20px 100px 20px; /* Padding extra para el footer fijo */
        }
        /* Capa oscura de superposición (ajustada para el degradado) */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.1); 
            z-index: 0;
        }
        .content-container {
            z-index: 10; 
            position: relative;
        }
        /* Efecto al pasar el mouse en la tarjeta */
        .card-container {
            transition: transform 0.3s ease-in-out;
            max-width: 400px; /* Asegura un buen tamaño en móvil y escritorio */
            width: 100%;
        }
        .card-container:hover {
            transform: translateY(-2px);
        }
        /* Estilo para el campo de selección (select) */
        .custom-select {
            appearance: none;
            /* Ícono SVG de flecha hacia abajo en verde */
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='%2310b981'%3E%3Cpath fill-rule='evenodd' d='M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z' clip-rule='evenodd' /%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            background-size: 1.5em 1.5em;
            padding-right: 3rem;
        }
        /* Animación de pulso para el número de tarjeta copiado */
        @keyframes pulse-green {
            0%, 100% {
                background-color: #d1fae5;
                border-color: #10b981;
            }
            50% {
                background-color: #ecfdf5;
                border-color: #059669;
            }
        }
        .copied-pulse {
            animation: pulse-green 1.5s 1;
        }
        .spinner {
            border: 4px solid rgba(255, 255, 255, 0.3);
            border-top: 4px solid white;
            border-radius: 50%;
            width: 1.5rem;
            height: 1.5rem;
            animation: spin 1s linear infinite;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        .main-content {
            flex-grow: 1; 
            display: flex;
            justify-content: center;
            align-items: flex-start;
            width: 100%;
        }
        .focus-glow:focus {
            box-shadow: 0 0 0 4px rgba(16, 185, 129, 0.4); /* green-500 with opacity */
        }
    </style>
</head>
<body>
    <div class="main-content">
        <div class="card-container content-container mt-8 bg-white p-6 md:p-8 shadow-2xl rounded-xl">
            
            <!-- Logo y Título -->
            <div class="flex flex-col items-center mb-6">
                <!-- Imagen de Autenticidad con placeholder de respaldo -->
                <img src="https://placehold.co/80x80/22c55e/ffffff?text=CM+Auth" 
                     alt="Logo de Autenticidad CubamaxTravel" 
                     class="w-20 h-20 rounded-full border-4 border-green-600 shadow-2xl p-1 bg-white ring-2 ring-green-400 transform hover:scale-105 transition-transform"
                >
                <h1 class="text-4xl font-extrabold text-gray-900 mt-3 text-center tracking-tight">Recarga Móvil</h1>
            </div>
            
            <!-- SECCIÓN 1: Historial Rápido de Última Solicitud -->
            <div id="transactionHistoryCard" class="bg-blue-50 border-t-4 border-blue-500 rounded-lg text-blue-800 px-4 py-3 shadow-md mb-6 hidden" role="alert">
                <div class="flex items-start">
                    <svg class="flex-shrink-0 h-6 w-6 text-blue-500 mr-4 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                    <div>
                        <p class="font-bold text-sm">ÚLTIMO PEDIDO EN REVISIÓN</p>
                        <ul class="text-xs mt-1 space-y-1">
                            <li>**Oferta:** <span id="historyOffer" class="font-semibold"></span></li>
                            <li>**Teléfono:** <span id="historyPhone" class="font-mono font-semibold"></span></li>
                            <li>**ID Transacción:** <span id="historyTransactionId" class="font-mono font-semibold"></span></li>
                            <li>**Estado:** <span id="historyStatus" class="font-bold text-blue-600">Pendiente</span></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- SECCIÓN 2: Temporizador de Pago -->
            <div id="timerCard" class="bg-yellow-100 border-l-4 border-yellow-500 text-yellow-800 p-4 rounded-xl mb-6 shadow-md hidden" role="alert">
                <div class="flex items-center justify-between">
                    <p class="font-bold text-sm flex items-center">
                        <svg class="h-5 w-5 mr-2 text-yellow-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        Tiempo restante para confirmar:
                    </p>
                    <div class="text-xl font-extrabold text-red-600" id="countdownDisplay">10:00</div>
                </div>
            </div>

            <!-- Mensaje de Advertencia Importante -->
            <div class="bg-red-50 border-l-4 border-red-500 text-red-800 p-3 rounded-lg mb-6 shadow-sm" role="alert">
                <p class="font-bold text-sm">¡Paso CRÍTICO!</p>
                <p class="text-xs mt-1">Debe enviar la transferencia **ANTES** de confirmar el pago aquí.</p>
            </div>

            <!-- SECCIÓN 3: Detalles de Pago (Tarjeta) -->
            <div class="bg-indigo-50 border-2 border-indigo-300 rounded-xl p-4 shadow-lg mb-6 text-center transition-colors duration-300">
                <p class="text-sm text-indigo-700 font-medium mb-1">Monto a transferir (CUP):</p>
                <p class="text-4xl font-black text-indigo-700 mb-3">
                    <span id="totalPagar">1950</span> <span class="text-xl font-bold">CUP</span>
                </p>
                <!-- Caja de Tarjeta con acción de copiar -->
                <div id="cardBox" class="bg-white border-2 border-blue-400 rounded-lg p-3 shadow-inner cursor-pointer transition-all duration-300 hover:bg-blue-50" onclick="copyToClipboard('9238129977325317')">
                    <p class="text-xs text-blue-700 mb-1 font-semibold">Tarjeta (Clic para Copiar):</p>
                    <p class="text-xl font-extrabold text-blue-900 tracking-wider flex items-center justify-center">
                        9238 1299 7732 5317
                        <svg id="copyIcon" class="inline-block w-5 h-5 ml-2 text-blue-600 transition-colors duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 5H6a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2v-1M8 5a2 2 0 002 2h2a2 2 0 002-2M8 5a2 2 0 012-2h2a2 2 0 012 2m0 0h2m-2 0h-2M4 7h16"></path></svg>
                    </p>
                    <p class="text-xs text-green-700 mt-1 font-bold" id="copyMessage" style="display:none;">¡Número de tarjeta copiado!</p>
                </div>
            </div>
            
            <!-- Formulario de Compra -->
            <form id="purchaseForm">
                
                <!-- Selector de Oferta -->
                <label for="monto" class="block text-gray-700 text-base font-semibold mb-2">Selecciona la oferta</label>
                <select id="monto" onchange="updatePaymentDetails(); startTimer();" class="custom-select block w-full px-4 py-3 text-base text-gray-800 bg-white border border-gray-400 rounded-lg focus:ring-green-500 focus:border-green-500 shadow-lg mb-4 focus-glow">
                    <option value="1500_1950" data-cup="1950" data-saldo="1500">1500 saldo - 1950 CUP</option>
                    <option value="2500_3250" data-cup="3250" data-saldo="2500">2500 saldo - 3250 CUP</option>
                    <option value="3500_4700" data-cup="4700" data-saldo="3500">3500 saldo - 4700 CUP</option>
                    <option value="5500_6700" data-cup="6700" data-saldo="5500">5500 saldo - 6700 CUP</option>
                    <option value="8300_9500" data-cup="9500" data-saldo="8300">8300 saldo - 9500 CUP</option>
                    <option value="promo_5625" data-cup="5625" data-saldo="25GB + Datos Ilimitados">Promo Internacional - 5625 CUP</option>
                </select>
                <p id="saldoInfo" class="text-sm text-gray-500 mb-6 italic">Obtendrás 1500 de saldo.</p>

                <!-- Campo de Número de Teléfono -->
                <label for="phoneNumber" class="block text-gray-700 text-base font-semibold mb-2 mt-4">Número de teléfono (Etecsa)</label>
                <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="Ej: 53xxxxxxx" required 
                    minlength="8" maxlength="8" oninput="validatePhone(this)"
                    class="w-full px-4 py-3 text-gray-700 bg-white border border-gray-400 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 shadow-inner mb-2 transition-colors focus-glow">
                <p id="phoneError" class="text-sm text-red-500 mb-4 h-5"></p>

                <!-- Campo de Número de Transacción -->
                <label for="transactionId" class="block text-gray-700 text-base font-semibold mb-2">No. de Transacción (Transfermóvil)</label>
                <input type="text" id="transactionId" name="transactionId" placeholder="Ej: BTR123456XYZ" required 
                    pattern="^BTR[0-9A-Za-z]{9}$" oninput="validateTransaction(this)"
                    class="w-full px-4 py-3 text-gray-700 bg-white border border-gray-400 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 shadow-inner mb-2 transition-colors focus-glow">
                <p id="transactionError" class="text-sm text-red-500 mb-6 h-5"></p>

                <!-- Botón de Confirmación con Spinner -->
                <button type="submit" id="confirmButton" class="w-full bg-green-600 hover:bg-green-700 text-white font-bold py-3 rounded-xl transition duration-300 ease-in-out shadow-xl transform hover:scale-[1.01] disabled:bg-gray-400 disabled:shadow-none flex items-center justify-center" disabled>
                    <span id="buttonText">Confirmar y Enviar Solicitud</span>
                    <span id="buttonSpinner" class="spinner ml-3 hidden"></span>
                </button>
                <p id="systemError" class="text-sm text-red-500 mt-3 text-center h-5"></p>
            </form>
        </div>
    </div>
    
    <!-- FOOTER FIJO CON INDICADOR DE SEGURIDAD -->
    <footer class="fixed bottom-0 left-0 right-0 z-20 bg-gray-800/95 backdrop-blur-sm shadow-2xl">
        <div class="max-w-4xl mx-auto px-4 py-3 flex justify-between items-center text-white">
            <p class="text-xs text-gray-400">&copy; 2024 CubamaxTravel - Recargas.</p>
            <!-- Indicador de seguridad SSL -->
            <div class="flex items-center text-green-400 text-xs font-semibold">
                <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2h2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2h2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"></path></svg>
                Conexión Segura SSL
            </div>
            <p class="text-xs font-mono text-gray-400">ID Usuario: <span id="footerUserId">Cargando...</span></p>
        </div>
    </footer>

    <!-- Modal de Confirmación -->
    <div id="confirmationModal" class="fixed inset-0 bg-gray-900 bg-opacity-80 z-50 hidden flex items-center justify-center p-4">
        <div class="bg-white rounded-xl shadow-2xl p-8 w-full max-w-sm transform transition-all duration-300 scale-100">
            <div class="text-center">
                <svg class="mx-auto h-16 w-16 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                <h3 class="text-2xl font-extrabold text-gray-900 mt-4">¡Solicitud Enviada!</h3>
                <p class="text-sm text-gray-600 mt-2">Tu pedido ha sido registrado. Lo verás en **Revisión** en el historial rápido.</p>
                <div class="mt-6 pt-4 border-t border-gray-200">
                    <button onclick="hideConfirmationModal()" class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-bold py-3 rounded-lg transition duration-300 shadow-md">Aceptar y Ver Historial</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Floating Security Seal (Detalle Extra) -->
    <div class="fixed top-4 right-4 z-30 bg-green-600 text-white px-3 py-1 rounded-full text-xs font-bold shadow-lg transform rotate-2 hidden md:block">
        VERIFICADO
    </div>

    <script type="module">
        // Importaciones de Firebase
        import { initializeApp } from "https://www.gstatic.com/firebasejs/11.6.1/firebase-app.js";
        import { getAuth, signInAnonymously, signInWithCustomToken, onAuthStateChanged } from "https://www.gstatic.com/firebasejs/11.6.1/firebase-auth.js";
        import { getFirestore, addDoc, collection, serverTimestamp, setLogLevel } from "https://www.gstatic.com/firebasejs/11.6.1/firebase-firestore.js";

        // Variables globales de Firebase y Timer
        let db;
        let auth;
        let userId = null;
        let app;
        let timerInterval;
        const TIMER_DURATION = 10 * 60; // 10 minutos en segundos

        // Configuración y variables del entorno Canvas (Asegúrate de que estas variables se llenen si usas hosting propio)
        const appId = typeof __app_id !== 'undefined' ? __app_id : 'default-app-id';
        // Nota: Si despliegas esto, necesitarás reemplazar la siguiente línea 
        // con tu propia configuración de Firebase (ej: const firebaseConfig = { apiKey: "...", projectId: "...", ... };)
        const firebaseConfig = typeof __firebase_config !== 'undefined' ? JSON.parse(__firebase_config) : {};
        const initialAuthToken = typeof __initial_auth_token !== 'undefined' ? __initial_auth_token : null;
        
        // Inicialización de Firebase
        if (Object.keys(firebaseConfig).length > 0) {
            app = initializeApp(firebaseConfig);
            db = getFirestore(app);
            auth = getAuth(app);
            setLogLevel('debug');

            onAuthStateChanged(auth, async (user) => {
                if (user) {
                    userId = user.uid;
                } else {
                    try {
                        // El entorno Canvas provee el token. Si lo usas fuera, usará Anónima.
                        if (initialAuthToken) {
                            await signInWithCustomToken(auth, initialAuthToken);
                        } else {
                            await signInAnonymously(auth);
                        }
                        // Asegurarse de obtener el UID después de la autenticación
                        userId = auth.currentUser?.uid || crypto.randomUUID(); 
                    } catch (error) {
                        console.error("Error al iniciar sesión:", error);
                        document.getElementById('systemError').textContent = 'Error de conexión con la base de datos.';
                    }
                }
                document.getElementById('footerUserId').textContent = userId ? userId.substring(0, 8) + '...' : 'Anónimo'; // Solo mostrar una parte
                checkFormValidity();
                startTimer(); // Inicia el timer al cargar o autenticar
            });
        } else {
            // Modo simulación si Firebase no está configurado (Funciona si no tienes hosting ni base de datos)
            userId = 'Simulación';
            document.getElementById('footerUserId').textContent = 'Simulación';
            console.warn("Firebase no inicializado. Usando simulación. La información NO se guardará.");
            startTimer();
            checkFormValidity();
        }

        // ---------------------------------------------------------------------
        // LÓGICA DE LA APLICACIÓN
        // ---------------------------------------------------------------------

        document.addEventListener('DOMContentLoaded', () => {
            document.getElementById('purchaseForm').addEventListener('submit', handleSubmit);
            updatePaymentDetails(); 
            loadLastTransaction(); // Carga la última transacción al iniciar
        });
        
        /**
         * Maneja el temporizador de pago.
         */
        window.startTimer = function () {
            // Si ya hay un temporizador corriendo, no lo reinicia a menos que sea un cambio de oferta.
            if (timerInterval) return; 
            
            const timerCard = document.getElementById('timerCard');
            const countdownDisplay = document.getElementById('countdownDisplay');
            timerCard.classList.remove('hidden');

            const storedStartTime = localStorage.getItem('timerStartTime');
            // Si no hay tiempo guardado O ha pasado mucho tiempo (ej: más de 20 minutos), reiniciar.
            let startTime = storedStartTime ? parseInt(storedStartTime) : Date.now();
            if ((Date.now() - startTime) / 1000 > TIMER_DURATION * 2) { 
                 startTime = Date.now();
            }
            localStorage.setItem('timerStartTime', startTime); 
            
            checkFormValidity();

            timerInterval = setInterval(() => {
                const elapsed = Math.floor((Date.now() - startTime) / 1000);
                let timeLeft = TIMER_DURATION - elapsed;

                if (timeLeft < 0) {
                    timeLeft = 0;
                }
                
                const minutes = Math.floor(timeLeft / 60);
                const seconds = timeLeft % 60;

                countdownDisplay.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
                
                // Efectos visuales de alerta
                if (timeLeft <= 30) {
                    countdownDisplay.classList.add('text-4xl', 'animate-pulse');
                    timerCard.classList.replace('bg-yellow-100', 'bg-red-100');
                    timerCard.classList.replace('border-yellow-500', 'border-red-500');
                } else if (timeLeft <= 180) { // Menos de 3 minutos
                    timerCard.classList.replace('bg-red-100', 'bg-yellow-100');
                    timerCard.classList.replace('border-red-500', 'border-yellow-500');
                    countdownDisplay.classList.remove('text-4xl', 'animate-pulse');
                } else {
                     countdownDisplay.classList.remove('text-4xl', 'animate-pulse');
                }

                if (timeLeft <= 0) {
                    clearInterval(timerInterval);
                    timerInterval = null; // Marcar como inactivo
                    countdownDisplay.textContent = '00:00';
                    document.getElementById('confirmButton').disabled = true;
                    document.getElementById('buttonText').textContent = 'Tiempo expirado. Recarga la página.';
                    timerCard.classList.replace('bg-yellow-100', 'bg-red-100');
                    timerCard.classList.replace('border-yellow-500', 'border-red-500');
                    timerCard.querySelector('p').textContent = 'Tiempo de Pago Expirado.';
                }
            }, 1000);
        }

        /**
         * Carga la última transacción guardada en localStorage (Historial Rápido)
         */
        function loadLastTransaction() {
            const lastTransaction = localStorage.getItem('lastTransaction');
            if (lastTransaction) {
                const data = JSON.parse(lastTransaction);
                displayLastTransaction(data);
            }
        }

        /**
         * Muestra los detalles de la última transacción.
         */
        function displayLastTransaction(data) {
            document.getElementById('historyOffer').textContent = data.oferta_seleccionada;
            document.getElementById('historyPhone').textContent = data.telefono_etecsa;
            document.getElementById('historyTransactionId').textContent = data.id_transaccion_tm;
            document.getElementById('historyStatus').textContent = data.estado; 
            document.getElementById('transactionHistoryCard').classList.remove('hidden');
        }

        /**
         * Actualiza el monto a pagar y el saldo que se recibirá según la opción seleccionada.
         */
        window.updatePaymentDetails = function () {
            const select = document.getElementById('monto');
            const selectedOption = select.options[select.selectedIndex];
            const cup = selectedOption.getAttribute('data-cup');
            const saldo = selectedOption.getAttribute('data-saldo');

            document.getElementById('totalPagar').textContent = cup;
            document.getElementById('saldoInfo').textContent = `Obtendrás ${saldo} de saldo.`;
            
            checkFormValidity();
        }

        /**
         * Valida el formato del número de teléfono.
         */
        window.validatePhone = function (input) {
            const regex = /^[5-6]\d{7}$/; 
            const errorElement = document.getElementById('phoneError');
            
            if (input.value.length === 8 && regex.test(input.value)) {
                errorElement.textContent = "";
                input.classList.remove('border-red-500', 'border-gray-400');
                input.classList.add('border-green-500');
            } else {
                errorElement.textContent = input.value.length > 0 && input.value.length < 8 ? "El número debe ser de 8 dígitos." : (input.value.length === 8 && !regex.test(input.value) ? "Debe empezar por 5 o 6." : "");
                input.classList.remove('border-green-500');
                if (input.value.length > 0) {
                    input.classList.add('border-red-500');
                } else {
                    input.classList.remove('border-red-500');
                }
            }
            checkFormValidity();
        }

        /**
         * Valida el formato del número de transacción de Transfermóvil.
         */
        window.validateTransaction = function (input) {
            const regex = /^BTR[0-9A-Za-z]{9}$/; 
            const errorElement = document.getElementById('transactionError');
            
            if (regex.test(input.value)) {
                errorElement.textContent = "";
                input.classList.remove('border-red-500', 'border-gray-400');
                input.classList.add('border-green-500');
            } else {
                errorElement.textContent = input.value.length > 0 ? "Formato incorrecto. Debe ser BTR seguido de 9 caracteres." : "";
                input.classList.remove('border-green-500');
                 if (input.value.length > 0) {
                    input.classList.add('border-red-500');
                } else {
                     input.classList.remove('border-red-500');
                }
            }
            checkFormValidity();
        }
        
        /**
         * Habilita o deshabilita el botón de confirmación.
         */
        function checkFormValidity() {
            const phoneInput = document.getElementById('phoneNumber');
            const transactionInput = document.getElementById('transactionId');
            const button = document.getElementById('confirmButton');

            const isPhoneValid = /^[5-6]\d{7}$/.test(phoneInput.value);
            const isTransactionValid = /^BTR[0-9A-Za-z]{9}$/.test(transactionInput.value);
            
            // Revisar el contenido del display, si no hay ':', asumimos 0 
            const timeParts = document.getElementById('countdownDisplay').textContent.split(':');
            const minutes = parseInt(timeParts[0]) || 0;
            const seconds = parseInt(timeParts[1]) || 0;
            const isTimerActive = minutes > 0 || seconds > 0;

            const isFirebaseReady = userId !== null && userId !== 'Simulación'; 

            if (isPhoneValid && isTransactionValid && (isFirebaseReady || userId === 'Simulación') && isTimerActive) {
                button.disabled = false;
                button.classList.remove('bg-gray-400');
                button.classList.add('bg-green-600');
            } else {
                button.disabled = true;
                button.classList.remove('bg-green-600');
                button.classList.add('bg-gray-400');
            }
        }

        /**
         * Copia el texto dado al portapapeles y activa la animación de confirmación.
         */
        window.copyToClipboard = function (text) {
            const cardBox = document.getElementById('cardBox');
            const copyMessage = document.getElementById('copyMessage');

            try {
                const textarea = document.createElement('textarea');
                textarea.value = text;
                document.body.appendChild(textarea);
                textarea.select();
                document.execCommand('copy'); 
                document.body.removeChild(textarea);

                copyMessage.style.display = 'block';
                // Reiniciar animación
                cardBox.classList.remove('copied-pulse'); 
                void cardBox.offsetWidth; // Trigger reflow
                cardBox.classList.add('copied-pulse');
                
                setTimeout(() => {
                    copyMessage.style.display = 'none';
                    cardBox.classList.remove('copied-pulse');
                }, 1500);

            } catch (err) {
                console.error('Error al intentar copiar:', err);
            }
        }

        /**
         * Muestra el modal de confirmación.
         */
        function showConfirmationModal() {
            document.getElementById('confirmationModal').classList.remove('hidden');
        }

        /**
         * Oculta el modal de confirmación y resetea el formulario.
         */
        window.hideConfirmationModal = function () {
            document.getElementById('confirmationModal').classList.add('hidden');
            // Resetea el formulario
            document.getElementById('purchaseForm').reset();
            updatePaymentDetails(); 
            // Limpia errores y clases de validación
            document.getElementById('phoneError').textContent = "";
            document.getElementById('transactionError').textContent = "";
            document.getElementById('phoneNumber').classList.remove('border-green-500', 'border-red-500');
            document.getElementById('transactionId').classList.remove('border-green-500', 'border-red-500');
            
            // Reinicia el timer para la próxima compra
            clearInterval(timerInterval);
            timerInterval = null;
            localStorage.removeItem('timerStartTime');
            startTimer(); 
        }
        
        /**
         * Manejador de envío del formulario. Guarda en Firestore.
         */
        async function handleSubmit(event) {
            event.preventDefault();
            
            const button = document.getElementById('confirmButton');
            const spinner = document.getElementById('buttonSpinner');
            const buttonText = document.getElementById('buttonText');
            const systemError = document.getElementById('systemError');
            
            if (button.disabled) return;
            if (userId === null) {
                systemError.textContent = 'Autenticación pendiente, espera un momento.';
                return;
            }

            // Mostrar spinner y deshabilitar botón
            button.disabled = true;
            buttonText.textContent = 'Enviando...';
            spinner.classList.remove('hidden');
            systemError.textContent = '';
            
            const select = document.getElementById('monto');
            const selectedOption = select.options[select.selectedIndex];
            const phoneNumber = document.getElementById('phoneNumber').value;
            const transactionId = document.getElementById('transactionId').value;
            
            const purchaseData = {
                userId: userId,
                appId: appId,
                oferta_seleccionada: selectedOption.text,
                monto_cup: selectedOption.getAttribute('data-cup'),
                monto_saldo: selectedOption.getAttribute('data-saldo'),
                telefono_etecsa: phoneNumber,
                id_transaccion_tm: transactionId,
                fecha_solicitud: serverTimestamp(),
                estado: 'Pendiente', 
                tarjeta_cubamax: '9238129977325317'
            };

            try {
                // Ruta para datos públicos (las solicitudes deben ser visibles para quien las procesa)
                const collectionPath = `artifacts/${appId}/public/data/compras_saldo`;
                
                if (db && userId !== 'Simulación') {
                    // Solo intentar guardar si db está inicializado y no es simulación
                    const docRef = await addDoc(collection(db, collectionPath), purchaseData);
                    console.log("Documento guardado con ID: ", docRef.id);
                } else {
                    console.warn("Simulación: Pedido registrado localmente. La información NO se guardó en la nube.");
                }
                
                // Guardar la última transacción en localStorage y mostrar (Historial Rápido)
                localStorage.setItem('lastTransaction', JSON.stringify({
                    oferta_seleccionada: purchaseData.oferta_seleccionada,
                    telefono_etecsa: purchaseData.telefono_etecsa,
                    id_transaccion_tm: purchaseData.id_transaccion_tm,
                    estado: 'Pendiente'
                }));

                displayLastTransaction(purchaseData);
                showConfirmationModal();

            } catch (e) {
                console.error("Error al añadir documento a Firestore: ", e);
                systemError.textContent = 'Error al registrar. Revisa tu conexión a Internet o inténtalo de nuevo.';
            } finally {
                // Ocultar spinner y restaurar botón
                spinner.classList.add('hidden');
                buttonText.textContent = 'Confirmar y Enviar Solicitud';
                checkFormValidity(); 
            }
        }

    </script>
</body>
</html>

