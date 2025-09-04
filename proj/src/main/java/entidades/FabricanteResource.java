package br.com.loja.resource;

import br.com.loja.entity.Fabricante;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.eclipse.microprofile.openapi.annotations.Operation;
import org.eclipse.microprofile.openapi.annotations.tags.Tag;

import java.util.List;

@Path("/fabricantes")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Tag(name = "Fabricantes", description = "Operações relacionadas aos fabricantes de produtos")
public class FabricanteResource {

    @GET
    @Operation(summary = "Listar todos os fabricantes", description = "Retorna uma lista com todos os fabricantes cadastrados")
    public List<Fabricante> listarTodos() {
        return Fabricante.listAll();
    }

    @GET
    @Path("/{id}")
    @Operation(summary = "Buscar fabricante por ID", description = "Retorna um fabricante específico pelo seu ID")
    public Response buscarPorId(@PathParam("id") Long id) {
        Fabricante fabricante = Fabricante.findById(id);
        if (fabricante == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(fabricante).build();
    }

    @POST
    @Transactional
    @Operation(summary = "Criar novo fabricante", description = "Cria um novo fabricante no sistema")
    public Response criar(@Valid Fabricante fabricante) {
        // Verificar se já existe um fabricante com o mesmo nome
        Fabricante fabricanteExistente = Fabricante.findByNome(fabricante.nome);
        if (fabricanteExistente != null) {
            return Response.status(Response.Status.CONFLICT)
                    .entity("Fabricante com este nome já existe")
                    .build();
        }

        fabricante.persist();
        return Response.status(Response.Status.CREATED).entity(fabricante).build();
    }

    @PUT
    @Path("/{id}")
    @Transactional
    @Operation(summary = "Atualizar fabricante", description = "Atualiza um fabricante existente")
    public Response atualizar(@PathParam("id") Long id, @Valid Fabricante fabricanteAtualizado) {
        Fabricante fabricante = Fabricante.findById(id);
        if (fabricante == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        // Verificar se já existe outro fabricante com o mesmo nome
        Fabricante fabricanteExistente = Fabricante.findByNome(fabricanteAtualizado.nome);
        if (fabricanteExistente != null && !fabricanteExistente.codigo.equals(id)) {
            return Response.status(Response.Status.CONFLICT)
                    .entity("Fabricante com este nome já existe")
                    .build();
        }

        fabricante.nome = fabricanteAtualizado.nome;
        return Response.ok(fabricante).build();
    }

    @DELETE
    @Path("/{id}")
    @Transactional
    @Operation(summary = "Excluir fabricante", description = "Remove um fabricante do sistema")
    public Response excluir(@PathParam("id") Long id) {
        Fabricante fabricante = Fabricante.findById(id);
        if (fabricante == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        // Verificar se o fabricante tem produtos associados
        if (fabricante.countProdutos() > 0) {
            return Response.status(Response.Status.CONFLICT)
                    .entity("Não é possível excluir fabricante que possui produtos associados")
                    .build();
        }

        fabricante.delete();
        return Response.noContent().build();
    }

    @GET
    @Path("/nome/{nome}")
    @Operation(summary = "Buscar fabricantes por nome", description = "Retorna fabricantes que contenham o nome especificado")
    public List<Fabricante> buscarPorNome(@PathParam("nome") String nome) {
        return Fabricante.findByNomeContaining(nome);
    }
}