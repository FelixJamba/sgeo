/** Carregar Região/Ueo/Subunidade------Gerar Estrutura Especifica------------------------------------------------*/
$(document).ready(function () {
    $("#id_regiao").on("change", function () {
        let regiaoId = $(this).val();
        $("#id_pai").empty().append('<option value="">Carregando...</option>');
        $("#subunidade")
            .empty()
            .append('<option value="">-- Selecione a Subunidade --</option>');

        if (regiaoId) {
            $.get(`/get-ueos/${regiaoId}`, function (data) {
                $("#id_pai")
                    .empty()
                    .append('<option value="">Selecione</option>');
                data.forEach((ueo) => {
                    $("#id_pai").append(
                        `<option value="${ueo.id_unidade_pai}">${ueo.Ueo}</option>`
                    );
                });
            });
        }
    });

    $("#id_pai").on("change", function () {
        let ueoId = $(this).val();
        $("#subunidade")
            .empty()
            .append('<option value="">Carregando...</option>');

        if (ueoId) {
            $.get(`/get-subunidades/${ueoId}`, function (data) {
                $("#subunidade")
                    .empty()
                    .append(
                        '<option value="">-- Selecione a Subunidade --</option>'
                    );
                data.forEach((sub) => {
                    $("#subunidade").append(
                        `<option value="${sub.id_es}">${sub.descricao_sub_unidade}</option>`
                    );
                });
            });
        }
    });
});
/**------------------------------------------------------------------------------------------------------------------------- */

/**-------------Carregar Região/Ueo-----Gerar-Estrutura-Geral---------------- */
document.addEventListener("DOMContentLoaded", function () {
    const regiaoSelect = document.getElementById("regiao");
    const unidadeSelect = document.getElementById("unidade");

    regiaoSelect.addEventListener("change", function () {
        const regiaoId = this.value;
        unidadeSelect.innerHTML = '<option value="">Carregando...</option>';

        if (regiaoId) {
            fetch(`/get-ueos/${regiaoId}`) // <- SEM "estrutura" aqui
                .then((response) => response.json())
                .then((data) => {
                    unidadeSelect.innerHTML =
                        '<option value="">Selecione</option>';
                    data.forEach((ueo) => {
                        const option = document.createElement("option");
                        option.value = ueo.id_unidade_pai;
                        option.textContent = ueo.Ueo;
                        unidadeSelect.appendChild(option);
                    });
                })
                .catch((error) => {
                    console.error("Erro ao carregar UEOs:", error);
                    unidadeSelect.innerHTML =
                        '<option value="">Erro ao carregar</option>';
                });
        } else {
            unidadeSelect.innerHTML = '<option value="">Selecione</option>';
        }
    });
});

/** -----------------------------FIM-------------------------------------------------*/

/**dataTables Especialistas */
$(document).ready(function () {
    $("#table-especialista").DataTable({
        responsive: true,
        paging: true,
        searching: true,
        ordering: true,
        info: true,
        pageLength: 10, // Definir quantos registros mostrar por página
        lengthMenu: [
            [10, 25, 50, -1],
            [10, 25, 50, "Todos"],
        ],
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
                previous: "Anterior",
            },
        },
        dom: "Bfrtip",
        buttons: [
            //{ extend: 'copy', text: 'Copiar' },
            //{ extend: 'excel', text: 'Exportar Excel' },
            // { extend: 'print', text: 'Imprimir' }
        ],
    });
});
/**Fim dataTables Especialistas */

/**Pesquisa por NIP */
document.addEventListener("DOMContentLoaded", function () {
    const input = document.getElementById("pesquisar_nip");
    const results = document.getElementById("autocomplete-results");

    input.addEventListener("input", function () {
        const query = this.value;

        if (query.length >= 1) {
            fetch(
                `/structure/search-militar?query=${encodeURIComponent(query)}`
            )
                .then((response) => response.json())
                .then((data) => {
                    results.innerHTML = "";

                    if (data.length === 0) {
                        results.classList.remove("d-none");
                        results.innerHTML =
                            '<div class="list-group-item">Nenhum resultado encontrado</div>';
                        return;
                    }

                    results.classList.remove("d-none");

                    data.forEach((item) => {
                        const div = document.createElement("div");
                        div.classList.add(
                            "list-group-item",
                            "list-group-item-action"
                        );
                        div.textContent = `${item.nip} - ${item.PostoAbrev} - ${item.nome}`;
                        div.dataset.id = item.id_pessoa_juridica;
                        div.dataset.nip = item.nip;
                        div.dataset.nome = item.nome;

                        div.addEventListener("click", function () {
                            input.value = `${this.dataset.nip} - ${this.dataset.nome}`;
                            document.getElementById(
                                "id_pessoa_juridica"
                            ).value = this.dataset.id;
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
});

/**FIM------------------------------------------------- */

/** provincia/municipio */

$(document).ready(function () {
    $("#id_provincia_residencia").on("change", function () {
        var provinciaId = $(this).val();
        $("#id_municipio_residencia").html(
            '<option value="">Carregando...</option>'
        );
        $("#id_zona").html(
            '<option value="">Selecione um município primeiro</option>'
        );
        $("#id_bairro").html(
            '<option value="">Selecione uma zona primeiro</option>'
        );

        if (provinciaId) {
            $.getJSON("/municipios/" + provinciaId, function (data) {
                var options = '<option value="">Selecione</option>';
                $.each(data, function (key, value) {
                    options +=
                        '<option value="' + key + '">' + value + "</option>";
                });
                $("#id_municipio_residencia").html(options);
            });
        }
    });

    $("#id_municipio_residencia").on("change", function () {
        var municipioId = $(this).val();
        $("#id_zona").html('<option value="">Carregando...</option>');
        $("#id_bairro").html(
            '<option value="">Selecione uma zona primeiro</option>'
        );

        if (municipioId) {
            $.getJSON("/zonas/" + municipioId, function (data) {
                var options = '<option value="">Selecione</option>';
                $.each(data, function (key, value) {
                    options +=
                        '<option value="' + key + '">' + value + "</option>";
                });
                $("#id_zona").html(options);
            });
        }
    });

    $("#id_zona").on("change", function () {
        var zonaId = $(this).val();
        $("#id_bairro").html('<option value="">Carregando...</option>');

        if (zonaId) {
            $.getJSON("/bairros/" + zonaId, function (data) {
                var options = '<option value="">Selecione</option>';
                $.each(data, function (key, value) {
                    options +=
                        '<option value="' + key + '">' + value + "</option>";
                });
                $("#id_bairro").html(options);
            });
        }
    });
});

////////////////////Select Provincia de Nascimento/////////////////////////////////

$(document).ready(function () {
    $("#id_provincia").change(function () {
        var provinciaId = $(this).val();

        // Limpa e desabilita o select de municípios enquanto carrega
        $("#idmunicipio")
            .empty()
            .append('<option value="">Carregando...</option>')
            .prop("disabled", true);

        if (provinciaId) {
            $.ajax({
                url: "/municipios/" + provinciaId,
                type: "GET",
                dataType: "json",
                success: function (data) {
                    $("#idmunicipio")
                        .empty()
                        .append('<option value="">Selecione</option>')
                        .prop("disabled", false);

                    $.each(data, function (key, value) {
                        $("#idmunicipio").append(
                            '<option value="' + key + '">' + value + "</option>"
                        );
                    });
                },
                error: function () {
                    $("#idmunicipio")
                        .empty()
                        .append('<option value="">Erro ao carregar</option>');
                },
            });
        } else {
            $("#idmunicipio")
                .empty()
                .append(
                    '<option value="">Selecione uma província primeiro</option>'
                )
                .prop("disabled", false);
        }
    });
});

/** Fim */

/*Especialiadades po quadro especial*/
$(document).ready(function () {
    $("#quadro_especial").change(function () {
        var quadroId = $(this).val();

        // Limpa e desabilita o select de municípios enquanto carrega
        $("#especialidade")
            .empty()
            .append('<option value="">Carregando...</option>')
            .prop("disabled", true);

        if (quadroId) {
            $.ajax({
                url: "/especialidade/" + quadroId,
                type: "GET",
                dataType: "json",
                success: function (data) {
                    $("#especialidade")
                        .empty()
                        .append('<option value="">Selecione</option>')
                        .prop("disabled", false);

                    $.each(data, function (key, value) {
                        $("#especialidade").append(
                            '<option value="' + key + '">' + value + "</option>"
                        );
                    });
                },
                error: function () {
                    $("#especialidade")
                        .empty()
                        .append('<option value="">Erro ao carregar </option>');
                },
            });
        } else {
            $("#especialidade")
                .empty()
                .append(
                    '<option value="">Selecione uma província primeiro</option>'
                )
                .prop("disabled", false);
        }
    });
});

$(document).ready(function () {
    $("#id_regiao").change(function () {
        var regiaoID = $(this).val();

        // Limpa e desabilita o select de ueo enquanto carrega
        $("#id_pai")
            .empty()
            .append('<option value="">Carregando...</option>')
            .prop("disabled", true);

        if (regiaoID) {
            $.ajax({
                url: "/ueo/" + regiaoID,
                type: "GET",
                dataType: "json",
                success: function (data) {
                    $("#id_pai")
                        .empty()
                        .append('<option value="">Selecione</option>')
                        .prop("disabled", false);

                    $.each(data, function (key, value) {
                        $("#id_pai").append(
                            '<option value="' + key + '">' + value + "</option>"
                        );
                    });
                },
                error: function () {
                    $("#id_pai")
                        .empty()
                        .append('<option value="">Erro ao carregar </option>');
                },
            });
        } else {
            $("#id_pai")
                .empty()
                .append(
                    '<option value="">Selecione uma região primeiro</option>'
                )
                .prop("disabled", false);
        }
    });
});

/* Cargos poR Função*/
$(document).ready(function () {
    $("#id_funcao").change(function () {
        var funcaoId = $(this).val();

        // Limpa e desabilita o select de cargos enquanto carrega
        $("#id_cargo")
            .empty()
            .append('<option value="">Carregando...</option>')
            .prop("disabled", true);

        if (funcaoId) {
            $.ajax({
                url: "/cargo/" + funcaoId,
                type: "GET",
                dataType: "json",
                success: function (data) {
                    $("#id_cargo")
                        .empty()
                        .append('<option value="">Selecione</option>')
                        .prop("disabled", false);

                    $.each(data, function (key, value) {
                        $("#id_cargo").append(
                            '<option value="' + key + '">' + value + "</option>"
                        );
                    });
                },
                error: function () {
                    $("#id_cargo")
                        .empty()
                        .append('<option value="">Erro ao carregar </option>');
                },
            });
        } else {
            $("#id_cargo")
                .empty()
                .append(
                    '<option value="">Selecione uma funçao primeiro</option>'
                )
                .prop("disabled", false);
        }
    });
});
/** */

/**Condiçoes de uma situação militar */
$(document).ready(function () {
    $("#id_situacao").change(function () {
        var situacaoId = $(this).val();

        // Limpa e desabilita o select de condições enquanto carrega
        $("#id_condicao")
            .empty()
            .append('<option value="">Carregando...</option>')
            .prop("disabled", true);

        if (situacaoId) {
            $.ajax({
                url: "/condicao/" + situacaoId,
                type: "GET",
                dataType: "json",
                success: function (data) {
                    $("#id_condicao")
                        .empty()
                        .append('<option value="">Selecione</option>')
                        .prop("disabled", false);

                    // Aqui tratamos o retorno do pluck (id => descricao)
                    $.each(data, function (id, descricao) {
                        $("#id_condicao").append(
                            '<option value="' +
                                id +
                                '">' +
                                descricao +
                                "</option>"
                        );
                    });
                },
                error: function () {
                    $("#id_condicao")
                        .empty()
                        .append('<option value="">Erro ao carregar</option>')
                        .prop("disabled", false);
                },
            });
        } else {
            $("#id_condicao")
                .empty()
                .append(
                    '<option value="">Selecione uma situação primeiro</option>'
                )
                .prop("disabled", false);
        }
    });
});
/** Fim*/

/**Condiçoes de uma situação militar */
$(document).ready(function () {
    $("#id_situacao").change(function () {
        var situacaoId = $(this).val();

        // Limpa e desabilita o select de condições enquanto carrega
        $("#id_condicao")
            .empty()
            .append('<option value="">Carregando...</option>')
            .prop("disabled", true);

        if (situacaoId) {
            $.ajax({
                url: "/condicao/" + situacaoId,
                type: "GET",
                dataType: "json",
                success: function (data) {
                    $("#id_condicao")
                        .empty()
                        .append('<option value="">Selecione</option>')
                        .prop("disabled", false);

                    // Aqui tratamos o retorno do pluck (id => descricao)
                    $.each(data, function (id, descricao) {
                        $("#id_condicao").append(
                            '<option value="' +
                                id +
                                '">' +
                                descricao +
                                "</option>"
                        );
                    });
                },
                error: function () {
                    $("#id_condicao")
                        .empty()
                        .append('<option value="">Erro ao carregar</option>')
                        .prop("disabled", false);
                },
            });
        } else {
            $("#id_condicao")
                .empty()
                .append(
                    '<option value="">Selecione uma situação primeiro</option>'
                )
                .prop("disabled", false);
        }
    });
});

/**************************------    Regiões de um Ramo  -----***************************************** */
document.getElementById('ramo').addEventListener('change', function () {
    const ramoID = this.value;
    const regiaoSelect = document.getElementById('id_regiao');

    // Limpa as opções atuais
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


/** -------------------------------------------------*/

/**Gráfico especialistasPorRegiao */

/** FIM*/

/**Rspecialista */
// Pré-visualização da foto
function previewFoto(input) {
    if (input.files && input.files[0]) {
        const reader = new FileReader();

        reader.onload = function (e) {
            document.getElementById("fotoPreview").src = e.target.result;
        };

        reader.readAsDataURL(input.files[0]);
    }
}
/** */

/**Grupos de Línguas */
document.addEventListener("DOMContentLoaded", function () {
    const container = document.getElementById("linguas-container");

    // Função para carregar línguas via AJAX
    function carregarLinguas(grupoId, selectElement, selectedId = null) {
        selectElement.innerHTML = "<option>Carregando...</option>";
        fetch(`/linguas-por-grupo/${grupoId}`)
            .then((response) => response.json())
            .then((data) => {
                let options = '<option value="">Selecione</option>';
                data.forEach((lingua) => {
                    const selected =
                        selectedId && selectedId == lingua.idLingua
                            ? "selected"
                            : "";
                    options += `<option value="${lingua.idLingua}" ${selected}>${lingua.descricaoLingua}</option>`;
                });
                selectElement.innerHTML = options;
            })
            .catch(() => {
                selectElement.innerHTML =
                    '<option value="">Erro ao carregar</option>';
            });
    }

    // Evento de mudança para selects dependentes
    container.addEventListener("change", function (e) {
        if (e.target.classList.contains("tipo-lingua")) {
            const grupoId = e.target.value;
            const linguaSelect = e.target
                .closest(".lingua-entry")
                .querySelector(".lingua");
            if (grupoId) {
                carregarLinguas(grupoId, linguaSelect);
            } else {
                linguaSelect.innerHTML =
                    '<option value="">Selecione o tipo primeiro</option>';
            }
        }
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const provinciaSelect = document.getElementById("id_provincia");
    const municipioSelect = document.getElementById("idmunicipio");
    const municipioSalvo = document.getElementById("municipio-atual")?.value;

    function carregarMunicipios(provinciaId, municipioSelecionado = null) {
        municipioSelect.innerHTML = '<option value="">Carregando...</option>';

        fetch(`/municipios/${provinciaId}`)
            .then((response) => response.json())
            .then((data) => {
                municipioSelect.innerHTML =
                    '<option value="">Selecione o Município</option>';
                for (const [id, nome] of Object.entries(data)) {
                    const option = document.createElement("option");
                    option.value = id;
                    option.textContent = nome;
                    if (id === municipioSelecionado) {
                        option.selected = true;
                    }
                    municipioSelect.appendChild(option);
                }
            })
            .catch((error) => {
                municipioSelect.innerHTML =
                    '<option value="">Erro ao carregar</option>';
                console.error("Erro ao carregar municípios:", error);
            });
    }

    provinciaSelect.addEventListener("change", function () {
        const provinciaId = this.value;
        if (provinciaId) {
            carregarMunicipios(provinciaId);
        } else {
            municipioSelect.innerHTML =
                '<option value="">Selecione o Município</option>';
        }
    });

    // PRE-CARREGAMENTO AUTOMÁTICO NO EDIT
    if (provinciaSelect.value && municipioSalvo) {
        carregarMunicipios(provinciaSelect.value, municipioSalvo);
    }
});

//Adiccionar e Remover (Formulários de cadastro e edição)
// Função genérica para adicionar nova entrada
function addNewEntry(containerId, entryClass, btnRemoveClass) {
    const container = document.getElementById(containerId);
    const entries = container.getElementsByClassName(entryClass);
    const lastEntry = entries[entries.length - 1];
    const newEntry = lastEntry.cloneNode(true);

    // Limpa os valores
    newEntry.querySelectorAll("input").forEach((input) => {
        if (input.type !== "button") input.value = "";
    });
    newEntry.querySelectorAll("select").forEach((select) => {
        select.selectedIndex = 0;
    });

    // Remove IDs duplicados
    newEntry.querySelectorAll("[id]").forEach((el) => el.removeAttribute("id"));

    // Ativa botão de remoção
    const removeBtn = newEntry.querySelector(`.${btnRemoveClass}`);
    if (removeBtn) removeBtn.disabled = false;

    container.appendChild(newEntry);

    // Reindexar todos os names
    renumerarEntries(containerId, entryClass);
}

// Função para reindexar os names
function renumerarEntries(containerId, entryClass) {
    const container = document.getElementById(containerId);
    const entries = container.getElementsByClassName(entryClass);

    for (let i = 0; i < entries.length; i++) {
        entries[i].querySelectorAll("[name]").forEach((element) => {
            let name = element.getAttribute("name");
            name = name.replace(/\[\d+\]/g, `[${i}]`);
            element.setAttribute("name", name);
        });
    }
}

// Configurar evento de remoção dinâmica
function setupRemoveHandler(containerId, entryClass, btnRemoveClass) {
    const container = document.getElementById(containerId);

    container.addEventListener("click", function (e) {
        if (e.target.closest(`.${btnRemoveClass}`)) {
            const entries = container.getElementsByClassName(entryClass);
            if (entries.length > 1) {
                e.target.closest(`.${entryClass}`).remove();
                renumerarEntries(containerId, entryClass);
            }
        }
    });
}

// Executa ao carregar
document.addEventListener("DOMContentLoaded", function () {
    // Linguas
    document
        .getElementById("addLingua")
        ?.addEventListener("click", function () {
            addNewEntry(
                "linguas-container",
                "lingua-entry",
                "btn-remove-lingua"
            );
        });
    setupRemoveHandler(
        "linguas-container",
        "lingua-entry",
        "btn-remove-lingua"
    );

    // Agregado Familiar
    document
        .getElementById("addAgregado")
        ?.addEventListener("click", function () {
            addNewEntry(
                "agregado-familiar-container",
                "agregado-familiar-entry",
                "btn-remove-agregado"
            );
        });
    setupRemoveHandler(
        "agregado-familiar-container",
        "agregado-familiar-entry",
        "btn-remove-agregado"
    );

    // Documentos
    document
        .getElementById("addDocumento")
        ?.addEventListener("click", function () {
            addNewEntry(
                "documentos-container",
                "documento-entry",
                "btn-remove-documento"
            );
        });
    setupRemoveHandler(
        "documentos-container",
        "documento-entry",
        "btn-remove-documento"
    );

    // Contactos
    document
        .getElementById("addContacto")
        ?.addEventListener("click", function () {
            addNewEntry(
                "contactos-container",
                "contacto-entry",
                "btn-remove-contacto"
            );
        });
    setupRemoveHandler(
        "contactos-container",
        "contacto-entry",
        "btn-remove-contacto"
    );

    // Formação
    document
        .getElementById("addFormacao")
        ?.addEventListener("click", function () {
            addNewEntry(
                "formacao-container",
                "formacao-entry",
                "btn-remove-formacao"
            );
        });
    setupRemoveHandler(
        "formacao-container",
        "formacao-entry",
        "btn-remove-formacao"
    );

    // Histórico - Postos
    document
        .getElementById("addHistorico")
        ?.addEventListener("click", function () {
            addNewEntry(
                "historico-container",
                "historico-posto-entry",
                "btn-remove-historico"
            );
        });
    setupRemoveHandler(
        "historico-container",
        "historico-posto-entry",
        "btn-remove-historico"
    );

    // Incorporações
    document
        .getElementById("addIncorporacao")
        ?.addEventListener("click", function () {
            addNewEntry(
                "incorporacoes-container",
                "incorporacao-entry",
                "btn-remove-incorporacao"
            );
        });
    setupRemoveHandler(
        "incorporacoes-container",
        "incorporacao-entry",
        "btn-remove-incorporacao"
    );
});

// Ordens por Tipo
$(document).ready(function () {
    // Quando o tipo de ordem mudar
    $(document).on("change", ".tipo-ordem", function () {
        let tipoId = $(this).val();
        let ordemSelect = $(this)
            .closest(".historico-posto-entry")
            .find(".ordem");

        ordemSelect.html('<option value="">Carregando...</option>');

        if (tipoId) {
            $.ajax({
                url: "/ordens/by-tipo/" + tipoId,
                type: "GET",
                dataType: "json",
                success: function (data) {
                    ordemSelect
                        .empty()
                        .append('<option value="">Selecione</option>');
                    $.each(data, function (key, ordem) {
                        ordemSelect.append(
                            '<option value="' +
                                ordem.id +
                                '">' +
                                ordem.referencia_ordem +
                                "</option>"
                        );
                    });
                },
                error: function () {
                    ordemSelect
                        .empty()
                        .append('<option value="">Erro ao carregar</option>');
                },
            });
        } else {
            ordemSelect
                .empty()
                .append('<option value="">Selecione o tipo primeiro</option>');
        }
    });
});

$(document).ready(function () {

    // função para carregar ordens para uma linha (row)
    function loadOrdensForRow($row) {
        var tipoId = $row.find('.tipo-ordem').val();
        var $ordemSelect = $row.find('.ordem');
        var selected = $ordemSelect.data('selected') || '';

        $ordemSelect.html('<option value="">Carregando...</option>');

        if (!tipoId) {
            $ordemSelect.html('<option value="">Selecione o tipo primeiro</option>');
            return;
        }

        $.ajax({
            url: '/ordens/by-tipo/' + tipoId,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                $ordemSelect.empty().append('<option value="">Selecione</option>');
                $.each(data, function (idx, item) {
                    // item deve ter: id e referencia_ordem
                    var $opt = $('<option>', { value: item.id, text: item.referencia_ordem });
                    $ordemSelect.append($opt);
                });

                if (selected) {
                    $ordemSelect.val(selected);
                    // remove data-selected para não reaplicar quando user trocar tipo
                    $ordemSelect.data('selected', '');
                }
            },
            error: function () {
                $ordemSelect.html('<option value="">Erro ao carregar</option>');
            }
        });
    }

    // ao mudar tipo de ordem, carrega ordens para a linha correspondente
    $(document).on('change', '.tipo-ordem', function () {
        var $row = $(this).closest('.historico-posto-entry');
        // se o user trocar o tipo manualmente, limpamos data-selected para evitar override
        $row.find('.ordem').data('selected', '');
        loadOrdensForRow($row);
    });

    // no carregamento da página, inicializa cada linha existente
    $('.historico-posto-entry').each(function () {
        loadOrdensForRow($(this));
    });

   
});

//Show photo on create
document.addEventListener("DOMContentLoaded", function () {
    const inputFile = document.getElementById("foto_militar");
    const previewImg = document.getElementById("fotoPreview");

    inputFile.addEventListener("change", function (event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();

            reader.onload = function (e) {
                previewImg.src = e.target.result;
            };

            reader.readAsDataURL(file);
        } else {
            // Se o utilizador remover a imagem
            previewImg.src = "{{ asset('images/default-profile.png') }}";
        }
    });
}); 

/*------------------ Habilitar/Mudar regiões-ramo -------------------*/

document.addEventListener('DOMContentLoaded', function () {
    const ramoSelect = document.getElementById('ramo');
    const labelRegiao = document.getElementById('label-regiao');

    ramoSelect.addEventListener('change', function () {
        const selectedOption = ramoSelect.options[ramoSelect.selectedIndex];
        const ramoID = selectedOption.value;
        const ramoDesc = selectedOption.getAttribute('data-desc');

        // muda o texto da label conforme o ramo
        if (ramoID == 1 || ramoDesc?.toUpperCase() === 'FAA') {
            labelRegiao.innerHTML = '<i class="fas fa-map-marker-alt me-2"></i>Órgãos <span class="text-danger">*</span>';
        } else {
            labelRegiao.innerHTML = '<i class="fas fa-map-marker-alt me-2"></i>Região <span class="text-danger">*</span>';
        }
    });
});
/*---------------------------------------------------------------------------------*/


