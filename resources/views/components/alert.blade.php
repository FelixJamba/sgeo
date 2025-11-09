@if (session('success'))
<script>
    document.addEventListener("DOMContentLoaded", () => {
        Swal.fire({
            icon: 'success',
            title: 'Sucesso!',
            text: "{{ session('success') }}",
            confirmButtonColor: '#198754'
        });
    });
</script>
@endif

@if (session('error'))
<script>
    document.addEventListener("DOMContentLoaded", () => {
        Swal.fire({
            icon: 'error',
            title: 'Erro!',
            text: "{{ session('error') }}",
            confirmButtonColor: '#dc3545'
        });
    });
</script>
@endif

@if ($errors->any())
<script>
    document.addEventListener("DOMContentLoaded", () => {
        Swal.fire({
            icon: 'warning',
            title: 'Atenção!',
            html: `{!! implode('<br>', $errors->all()) !!}`,
            confirmButtonColor: '#ffc107'
        });
    });
</script>
@endif


<!-- Script para o botão de exclusão -->
<script>
document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll('.btn-delete').forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault();

            Swal.fire({
                title: 'Tem certeza?',
                text: "Você não poderá reverter isso!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                cancelButtonColor: '#3085d6',
                confirmButtonText: 'Sim, excluir!',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    this.closest('form').submit();
                }
            });
        });
    });
});
</script>