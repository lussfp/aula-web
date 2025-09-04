package br.com.loja.resource;

import br.com.loja.entity.Categoria;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.eclipse.microprofile.openapi.annotations.Operation;
import org.eclipse.microprofile.openapi.annotations.tags.Tag;

import java.util.List;

@Path("/categorias")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Tag(name = "Categorias", description = "Operações relacionadas às categorias de produtos")
public class CategoriaResource {

    @GET
    @Operation(summary = "Listar todas as categorias", description = "Retorna uma lista com todas as categorias cadastradas")
    public List<Categoria> listarTodas() {
        return Categoria.listAll();
    }

    @GET
    @Path("/{id}")
    @Operation(summary = "Buscar categoria por ID", description = "Retorna uma categoria específica pelo seu ID")
    public Response buscarPorId(@PathParam("id") Long id) {
        Categoria categoria = Categoria.findById(id);
        if (categoria == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(categoria).build();
    }

    @POST
    @Transactional
    @Operation(summary = "Criar nova categoria", description = "Cria uma nova categoria no sistema")
    public Response criar(@Valid Categoria categoria) {
        // Verificar se já existe uma categoria com o mesmo nome
        Categoria categoriaExistente = Categoria.findByNome(categoria.nome);
        if (categoriaExistente != null) {
            return Response.status(Response.Status.CONFLICT)
                    .entity("Categoria com este nome já existe")
                    .build();
        }

        categoria.persist();
        return Response.status(Response.Status.CREATED).entity(categoria).build();
    }

    @PUT
    @Path("/{id}")
    @Transactional
    @Operation(summary = "Atualizar categoria", description = "Atualiza uma categoria existente")
    public Response atualizar(@PathParam("id") Long id, @Valid Categoria categoriaAtualizada) {
        Categoria categoria = Categoria.findById(id);
        if (categoria == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        // Verificar se já existe outra categoria com o mesmo nome
        Categoria categoriaExistente = Categoria.findByNome(categoriaAtualizada.nome);
        if (categoriaExistente != null && !categoriaExistente.codigo.equals(id)) {
            return Response.status(Response.Status.CONFLICT)
                    .entity("Categoria com este nome já existe")
                    .build();
        }

        categoria.nome = categoriaAtualizada.nome;
        return Response.ok(categoria).build();
    }

    @DELETE
    @Path("/{id}")
    @Transactional
    @Operation(summary = "Excluir categoria", description = "Remove uma categoria do sistema")
    public Response excluir(@PathParam("id") Long id) {
        Categoria categoria = Categoria.findById(id);
        if (categoria == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        // Verificar se a categoria tem produtos associados
        if (categoria.countProdutos() > 0) {
            return Response.status(Response.Status.CONFLICT)
                    .entity("Não é possível excluir categoria que possui produtos associados")
                    .build();
        }

        categoria.delete();
        return Response.noContent().build();
    }

    @GET
    @Path("/nome/{nome}")
    @Operation(summary = "Buscar categorias por nome", description = "Retorna categorias que contenham o nome especificado")
    public List<Categoria> buscarPorNome(@PathParam("nome") String nome) {
        return Categoria.findByNomeContaining(nome);
    }
}