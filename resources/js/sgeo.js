/**
 * ========================================
 * SISTEMA DE GESTÃO MILITAR
 * Script Principal - Versão Organizada
 * ========================================
 */

// ============================================================================
// 1. CARREGAMENTO DE ESTRUTURAS HIERÁRQUICAS
// ============================================================================

/**
 * Carrega Região → UEO → Subunidade (Estrutura Específica)
 */
function initEstruturaEspecifica() {
    $("#id_regiao").on("change", function () {
        const regiaoId = $(this).val();
        $("#unidade").empty().append('<option value="">Carregando...</option>');
        $("#subunidade").empty().append('<option value="">-- Selecione a Subunidade --</option>');

        if (regiaoId) {
            $.get(`/get-ueos/${regiaoId}`, function (data) {
                $("#unidade").empty().append('<option value="">Selecione</option>');
                data.forEach((ueo) => {
                    $("#unidade").append(`<option value="${ueo.id_unidade_pai}">${ueo.Ueo}</option>`);
                });
            });
        }
    });

    $("#unidade").on("change", function () {
        const ueoId = $(this).val();
        $("#subunidade").empty().append('<option value="">Carregando...</option>');

        if (ueoId) {
            $.get(`/get-subunidades/${ueoId}`, function (data) {
                $("#subunidade").empty().append('<option value="">-- Selecione a Subunidade --</option>');
                data.forEach((sub) => {
                    $("#subunidade").append(`<option value="${sub.id_es}">${sub.descricao_sub_unidade}</option>`);
                });
            });
        }
    });
}

/**
 * Carrega Região → Unidade (Estrutura Geral)
 */
function initEstruturaGeral() {
    const regiaoSelect = document.getElementById("regiao");
    const unidadeSelect = document.getElementById("unidade");

    if (!regiaoSelect || !unidadeSelect) return;

    regiaoSelect.addEventListener("change", function () {
        const regiaoId = this.value;
        unidadeSelect.innerHTML = '<option value="">Carregando...</option>';

        if (regiaoId) {
            fetch(`/get-ueos/${regiaoId}`)
                .then((response) => response.json())
                .then((data) => {
                    unidadeSelect.innerHTML = '<option value="">Selecione</option>';
                    data.forEach((ueo) => {
                        const option = document.createElement("option");
                        option.value = ueo.id_unidade_pai;
                        option.textContent = ueo.Ueo;
                        unidadeSelect.appendChild(option);
                    });
                })
                .catch((error) => {
                    console.error("Erro ao carregar UEOs:", error);
                    unidadeSelect.innerHTML = '<option value="">Erro ao carregar</option>';
                });
        } else {
            unidadeSelect.innerHTML = '<option value="">Selecione</option>';
        }
    });
}

/**
 * Carrega Ramo → Região
 */
function initRamoRegiao() {
    const ramoSelect = document.getElementById('ramo');
    const regiaoSelect = document.getElementById('regiao');
    const labelRegiao = document.getElementById('label-regiao');

    if (!ramoSelect || !regiaoSelect) return;

    ramoSelect.addEventListener('change', function () {
        const ramoID = this.value;
        const selectedOption = ramoSelect.options[ramoSelect.selectedIndex];
        const ramoDesc = selectedOption.getAttribute('data-desc');

        // Atualiza label conforme o ramo
        if (labelRegiao) {
            if (ramoID == 1 || ramoDesc?.toUpperCase() === 'FAA') {
                labelRegiao.innerHTML = '<i class="fas fa-map-marker-alt me-2"></i>Órgãos <span class="text-danger">*</span>';
            } else {
                labelRegiao.innerHTML = '<i class="fas fa-map-marker-alt me-2"></i>Região <span class="text-danger">*</span>';
            }
        }

        // Carrega regiões
        regiaoSelect.innerHTML = '<option value="">Carregando...</option>';

        if (ramoID) {
            fetch(`/regioes/${ramoID}`)
                .then(response => response.json())
                .then(data => {
                    regiaoSelect.innerHTML = '<option value="">Selecione</option>';
                    data.forEach(regiao => {
                        const option = document.createElement('option');
                        option.value = regiao.id;
                        option.textContent = regiao.nome;
                        regiaoSelect.appendChild(option);
                    });
                })
                .catch(() => {
                    regiaoSelect.innerHTML = '<option value="">Erro ao carregar</option>';
                });
        } else {
            regiaoSelect.innerHTML = '<option value="">Selecione o ramo primeiro</option>';
        }
    });
}

// ============================================================================
// 2. LOCALIZAÇÃO (PROVÍNCIA, MUNICÍPIO, ZONA, BAIRRO)
// ============================================================================

/**
 * Província → Município → Zona → Bairro (Residência)
 */
function initLocalizacaoResidencia() {
    $("#id_provincia_residencia").on("change", function () {
        const provinciaId = $(this).val();
        $("#id_municipio_residencia").html('<option value="">Carregando...</option>');
        $("#id_zona").html('<option value="">Selecione um município primeiro</option>');
        $("#id_bairro").html('<option value="">Selecione uma zona primeiro</option>');

        if (provinciaId) {
            $.getJSON(`/municipios/${provinciaId}`, function (data) {
                let options = '<option value="">Selecione</option>';
                $.each(data, function (key, value) {
                    options += `<option value="${key}">${value}</option>`;
                });
                $("#id_municipio_residencia").html(options);
            });
        }
    });

    $("#id_municipio_residencia").on("change", function () {
        const municipioId = $(this).val();
        $("#id_zona").html('<option value="">Carregando...</option>');
        $("#id_bairro").html('<option value="">Selecione uma zona primeiro</option>');

        if (municipioId) {
            $.getJSON(`/zonas/${municipioId}`, function (data) {
                let options = '<option value="">Selecione</option>';
                $.each(data, function (key, value) {
                    options += `<option value="${key}">${value}</option>`;
                });
                $("#id_zona").html(options);
            });
        }
    });

    $("#id_zona").on("change", function () {
        const zonaId = $(this).val();
        $("#id_bairro").html('<option value="">Carregando...</option>');

        if (zonaId) {
            $.getJSON(`/bairros/${zonaId}`, function (data) {
                let options = '<option value="">Selecione</option>';
                $.each(data, function (key, value) {
                    options += `<option value="${key}">${value}</option>`;
                });
                $("#id_bairro").html(options);
            });
        }
    });
}

/**
 * Província → Município (Nascimento)
 */
function initLocalizacaoNascimento() {
    const provinciaSelect = $("#id_provincia");
    const municipioSelect = $("#idmunicipio");
    const municipioSalvo = $("#municipio-atual").val();

    function carregarMunicipios(provinciaId, municipioSelecionado = null) {
        municipioSelect.html('<option value="">Carregando...</option>').prop("disabled", true);

        $.ajax({
            url: `/municipios/${provinciaId}`,
            type: "GET",
            dataType: "json",
            success: function (data) {
                municipioSelect.html('<option value="">Selecione</option>').prop("disabled", false);
                $.each(data, function (key, value) {
                    const selected = (key === municipioSelecionado) ? 'selected' : '';
                    municipioSelect.append(`<option value="${key}" ${selected}>${value}</option>`);
                });
            },
            error: function () {
                municipioSelect.html('<option value="">Erro ao carregar</option>');
            }
        });
    }

    provinciaSelect.on("change", function () {
        const provinciaId = $(this).val();
        if (provinciaId) {
            carregarMunicipios(provinciaId);
        } else {
            municipioSelect.html('<option value="">Selecione uma província primeiro</option>').prop("disabled", false);
        }
    });

    // Pré-carregamento no modo edição
    if (provinciaSelect.val() && municipioSalvo) {
        carregarMunicipios(provinciaSelect.val(), municipioSalvo);
    }
}

// ============================================================================
// 3. QUADROS, ESPECIALIDADES E FUNÇÕES
// ============================================================================

/**
 * Quadro Especial → Especialidades
 */
function initQuadroEspecialidade() {
    $("#quadro_especial").on("change", function () {
        const quadroId = $(this).val();
        $("#especialidade").html('<option value="">Carregando...</option>').prop("disabled", true);

        if (quadroId) {
            $.ajax({
                url: `/especialidade/${quadroId}`,
                type: "GET",
                dataType: "json",
                success: function (data) {
                    $("#especialidade").html('<option value="">Selecione</option>').prop("disabled", false);
                    $.each(data, function (key, value) {
                        $("#especialidade").append(`<option value="${key}">${value}</option>`);
                    });
                },
                error: function () {
                    $("#especialidade").html('<option value="">Erro ao carregar</option>');
                }
            });
        } else {
            $("#especialidade").html('<option value="">Selecione o quadro primeiro</option>').prop("disabled", false);
        }
    });
}

/**
 * Função → Cargo
 */
function initFuncaoCargo() {
    $("#id_funcao").on("change", function () {
        const funcaoId = $(this).val();
        $("#id_cargo").html('<option value="">Carregando...</option>').prop("disabled", true);

        if (funcaoId) {
            $.ajax({
                url: `/cargo/${funcaoId}`,
                type: "GET",
                dataType: "json",
                success: function (data) {
                    $("#id_cargo").html('<option value="">Selecione</option>').prop("disabled", false);
                    $.each(data, function (key, value) {
                        $("#id_cargo").append(`<option value="${key}">${value}</option>`);
                    });
                },
                error: function () {
                    $("#id_cargo").html('<option value="">Erro ao carregar</option>');
                }
            });
        } else {
            $("#id_cargo").html('<option value="">Selecione uma função primeiro</option>').prop("disabled", false);
        }
    });
}

/**
 * Situação → Condição
 */
function initSituacaoCondicao() {
    $("#id_situacao").on("change", function () {
        const situacaoId = $(this).val();
        $("#id_condicao").html('<option value="">Carregando...</option>').prop("disabled", true);

        if (situacaoId) {
            $.ajax({
                url: `/condicao/${situacaoId}`,
                type: "GET",
                dataType: "json",
                success: function (data) {
                    $("#id_condicao").html('<option value="">Selecione</option>').prop("disabled", false);
                    $.each(data, function (id, descricao) {
                        $("#id_condicao").append(`<option value="${id}">${descricao}</option>`);
                    });
                },
                error: function () {
                    $("#id_condicao").html('<option value="">Erro ao carregar</option>').prop("disabled", false);
                }
            });
        } else {
            $("#id_condicao").html('<option value="">Selecione uma situação primeiro</option>').prop("disabled", false);
        }
    });
}

/**
 * Tipo de Ordem → Ordens
 */
function initTipoOrdem() {
    // Função para carregar ordens para uma linha específica
    function loadOrdensForRow($row) {
        const tipoId = $row.find('.tipo-ordem').val();
        const $ordemSelect = $row.find('.ordem');
        const selected = $ordemSelect.data('selected') || '';

        $ordemSelect.html('<option value="">Carregando...</option>');

        if (!tipoId) {
            $ordemSelect.html('<option value="">Selecione o tipo primeiro</option>');
            return;
        }

        $.ajax({
            url: `/ordens/by-tipo/${tipoId}`,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                $ordemSelect.empty().append('<option value="">Selecione</option>');
                $.each(data, function (idx, item) {
                    $ordemSelect.append(`<option value="${item.id}">${item.referencia_ordem}</option>`);
                });

                if (selected) {
                    $ordemSelect.val(selected);
                    $ordemSelect.data('selected', '');
                }
            },
            error: function () {
                $ordemSelect.html('<option value="">Erro ao carregar</option>');
            }
        });
    }

    // Evento de mudança
    $(document).on('change', '.tipo-ordem', function () {
        const $row = $(this).closest('.historico-posto-entry');
        $row.find('.ordem').data('selected', '');
        loadOrdensForRow($row);
    });

    // Inicialização ao carregar página
    $('.historico-posto-entry').each(function () {
        loadOrdensForRow($(this));
    });
}

// ============================================================================
// 4. PESQUISA E AUTOCOMPLETE
// ============================================================================

/**
 * Pesquisa de militar por NIP
 */
function initPesquisaNIP() {
    const input = document.getElementById("pesquisar_nip");
    const results = document.getElementById("autocomplete-results");

    if (!input || !results) return;

    input.addEventListener("input", function () {
        const query = this.value;

        if (query.length >= 1) {
            fetch(`/structure/search-militar?query=${encodeURIComponent(query)}`)
                .then((response) => response.json())
                .then((data) => {
                    results.innerHTML = "";

                    if (data.length === 0) {
                        results.classList.remove("d-none");
                        results.innerHTML = '<div class="list-group-item">Nenhum resultado encontrado</div>';
                        return;
                    }

                    results.classList.remove("d-none");

                    data.forEach((item) => {
                        const div = document.createElement("div");
                        div.classList.add("list-group-item", "list-group-item-action");
                        div.textContent = `${item.nip} - ${item.PostoAbrev} - ${item.nome}`;
                        div.dataset.id = item.id_pessoa_juridica;
                        div.dataset.nip = item.nip;
                        div.dataset.nome = item.nome;

                        div.addEventListener("click", function () {
                            input.value = `${this.dataset.nip} - ${this.dataset.nome}`;
                            document.getElementById("id_pessoa_juridica").value = this.dataset.id;
                            results.innerHTML = "";
                            results.classList.add("d-none");
                        });

                        results.appendChild(div);
                    });
                });
        } else {
            results.innerHTML = "";
            results.classList.add("d-none");
        }
    });

    document.addEventListener("click", function (e) {
        if (!input.contains(e.target) && !results.contains(e.target)) {
            results.innerHTML = "";
            results.classList.add("d-none");
        }
    });
}

// ============================================================================
// 5. DATATABLES
// ============================================================================

/**
 * Inicializa DataTable para especialistas
 */
function initDataTableEspecialistas() {
    const table = $("#table-especialista");
    if (table.length === 0) return;

    table.DataTable({
        responsive: true,
        paging: true,
        searching: true,
        order: [],
        ordering: true,
        info: true,
        pageLength: 10,
        lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
        language: {
            lengthMenu: "Mostrar _MENU_ registros por página",
            zeroRecords: "Nenhum registro encontrado",
            info: "Mostrando _START_ a _END_ de _TOTAL_ registros",
            infoEmpty: "Nenhum registro disponível",
            infoFiltered: "(Filtrado de _MAX_ registros no total)",
            search: "Pesquisar:",
            paginate: {
                first: "Primeiro",
                last: "Último",
                next: "Próximo",
                previous: "Anterior"
            }
        },
        dom: "Bfrtip",
        buttons: []
    });
}

function initDataTableEstrutura() {
    const table = $("#table-estrutura");
    if (table.length === 0) return;

    table.DataTable({
        responsive: true,
        paging: true,
        searching: true,
        order: [],
        ordering: true,
        info: true,
        pageLength: 10,
        lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
        language: {
            lengthMenu: "Mostrar _MENU_ registros por página",
            zeroRecords: "Nenhum registro encontrado",
            info: "Mostrando _START_ a _END_ de _TOTAL_ registros",
            infoEmpty: "Nenhum registro disponível",
            infoFiltered: "(Filtrado de _MAX_ registros no total)",
            search: "Pesquisar:",
            paginate: {
                first: "Primeiro",
                last: "Último",
                next: "Próximo",
                previous: "Anterior"
            }
        },
        dom: "Bfrtip",
        buttons: []
    });
}
// ============================================================================
// 6. GESTÃO DE FORMULÁRIOS DINÂMICOS (ADICIONAR/REMOVER)
// ============================================================================

/**
 * Adiciona nova entrada de formulário dinâmico
 */
function addNewEntry(containerId, entryClass, btnRemoveClass) {
    const container = document.getElementById(containerId);
    if (!container) return;

    const entries = container.getElementsByClassName(entryClass);
    const lastEntry = entries[entries.length - 1];
    const newEntry = lastEntry.cloneNode(true);

    // Limpa valores dos inputs
    newEntry.querySelectorAll("input").forEach((input) => {
        if (input.type !== "button") input.value = "";
    });

    // Reseta selects
    newEntry.querySelectorAll("select").forEach((select) => {
        select.selectedIndex = 0;
    });

    // Remove IDs duplicados
    newEntry.querySelectorAll("[id]").forEach((el) => el.removeAttribute("id"));

    // Ativa botão de remoção
    const removeBtn = newEntry.querySelector(`.${btnRemoveClass}`);
    if (removeBtn) removeBtn.disabled = false;

    container.appendChild(newEntry);

    // Reindexar names
    renumerarEntries(containerId, entryClass);
}

/**
 * Renumera os atributos name dos campos dinâmicos
 */
function renumerarEntries(containerId, entryClass) {
    const container = document.getElementById(containerId);
    if (!container) return;

    const entries = container.getElementsByClassName(entryClass);

    for (let i = 0; i < entries.length; i++) {
        entries[i].querySelectorAll("[name]").forEach((element) => {
            let name = element.getAttribute("name");
            name = name.replace(/\[\d+\]/g, `[${i}]`);
            element.setAttribute("name", name);
        });
    }
}

/**
 * Configura evento de remoção
 */
function setupRemoveHandler(containerId, entryClass, btnRemoveClass) {
    const container = document.getElementById(containerId);
    if (!container) return;

    container.addEventListener("click", function (e) {
        const removeBtn = e.target.closest(`.${btnRemoveClass}`);
        if (removeBtn) {
            const entries = container.getElementsByClassName(entryClass);
            if (entries.length > 1) {
                e.target.closest(`.${entryClass}`).remove();
                renumerarEntries(containerId, entryClass);
            }
        }
    });
}

/**
 * Inicializa todos os formulários dinâmicos
 */
function initFormulariosDinamicos() {
    const forms = [
        { btn: "addLingua", container: "linguas-container", entry: "lingua-entry", remove: "btn-remove-lingua" },
        { btn: "addAgregado", container: "agregado-familiar-container", entry: "agregado-familiar-entry", remove: "btn-remove-agregado" },
        { btn: "addDocumento", container: "documentos-container", entry: "documento-entry", remove: "btn-remove-documento" },
        { btn: "addContacto", container: "contactos-container", entry: "contacto-entry", remove: "btn-remove-contacto" },
        { btn: "addFormacao", container: "formacao-container", entry: "formacao-entry", remove: "btn-remove-formacao" },
        { btn: "addHistorico", container: "historico-container", entry: "historico-posto-entry", remove: "btn-remove-historico" },
        { btn: "addIncorporacao", container: "incorporacoes-container", entry: "incorporacao-entry", remove: "btn-remove-incorporacao" }
    ];

    forms.forEach(form => {
        const btn = document.getElementById(form.btn);
        if (btn) {
            btn.addEventListener("click", function () {
                addNewEntry(form.container, form.entry, form.remove);
            });
            setupRemoveHandler(form.container, form.entry, form.remove);
        }
    });
}

// ============================================================================
// 7. GRUPOS DE LÍNGUAS
// ============================================================================

/**
 * Carrega línguas por grupo
 */
function initGrupoLinguas() {
    const container = document.getElementById("linguas-container");
    if (!container) return;

    function carregarLinguas(grupoId, selectElement, selectedId = null) {
        selectElement.innerHTML = "<option>Carregando...</option>";
        fetch(`/linguas-por-grupo/${grupoId}`)
            .then((response) => response.json())
            .then((data) => {
                let options = '<option value="">Selecione</option>';
                data.forEach((lingua) => {
                    const selected = (selectedId && selectedId == lingua.idLingua) ? "selected" : "";
                    options += `<option value="${lingua.idLingua}" ${selected}>${lingua.descricaoLingua}</option>`;
                });
                selectElement.innerHTML = options;
            })
            .catch(() => {
                selectElement.innerHTML = '<option value="">Erro ao carregar</option>';
            });
    }

    container.addEventListener("change", function (e) {
        if (e.target.classList.contains("tipo-lingua")) {
            const grupoId = e.target.value;
            const linguaSelect = e.target.closest(".lingua-entry").querySelector(".lingua");
            if (grupoId) {
                carregarLinguas(grupoId, linguaSelect);
            } else {
                linguaSelect.innerHTML = '<option value="">Selecione o tipo primeiro</option>';
            }
        }
    });
}

// ============================================================================
// 8. PREVIEW DE IMAGENS
// ============================================================================

/**
 * Pré-visualização da foto
 */
function previewFoto(input) {
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById("fotoPreview").src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    }
}

/**
 * Preview de foto no create
 */
function initFotoPreview() {
    const inputFile = document.getElementById("foto_militar");
    const previewImg = document.getElementById("fotoPreview");

    if (!inputFile || !previewImg) return;

    inputFile.addEventListener("change", function (event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                previewImg.src = e.target.result;
            };
            reader.readAsDataURL(file);
        } else {
            previewImg.src = "/images/default-profile.png";
        }
    });
}

// ============================================================================
// 9. INICIALIZAÇÃO GERAL
// ============================================================================

$(document).ready(function () {
    // Estruturas hierárquicas
    initEstruturaEspecifica();
    initRamoRegiao();
    
    // Localização
    initLocalizacaoResidencia();
    initLocalizacaoNascimento();
    
    // Quadros e funções
    initQuadroEspecialidade();
    initFuncaoCargo();
    initSituacaoCondicao();
    initTipoOrdem();
    
    // Pesquisa
    initPesquisaNIP();
    
    // DataTables
    initDataTableEspecialistas();
    initDataTableEstrutura();
    
    // Formulários dinâmicos
    initFormulariosDinamicos();
    
    // Línguas
    initGrupoLinguas();
    
    // Preview de foto
    initFotoPreview();
});

document.addEventListener("DOMContentLoaded", function () {
    // Estrutura geral (vanilla JS)
    initEstruturaGeral();
});