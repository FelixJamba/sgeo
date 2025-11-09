/* Importar o framework Bootstrap */
import 'bootstrap';

import ApexCharts from 'apexcharts';
import axios from 'axios';
import Swal from 'sweetalert2';

window.axios = axios;

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
