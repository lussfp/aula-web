package br.com.loja.resource;

import br.com.loja.entity.Funcionario;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.eclipse.microprofile.openapi.annotations.Operation;
import org.eclipse.microprofile.openapi.annotations.tags.Tag;

import java.util.List;

@Path("/funcionarios")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Tag(name = "Funcionários", description = "Operações relacionadas aos funcionários")
public class FuncionarioResource {

    @GET
    @Operation(summary = "Listar todos os funcionários", description = "Retorna uma lista com todos os funcionários cadastrados")
    public List<Funcionario> listarTodos() {
        return Funcionario.listAll();
    }

    @GET
    @Path("/{id}")
    @Operation(summary = "Buscar funcionário por ID", description = "Retorna um funcionário específico pelo seu ID")
    public Response buscarPorId(@PathParam("id") Long id) {
        Funcionario funcionario = Funcionario.findById(id);
        if (funcionario == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(funcionario).build();
    }

    @POST
    @Transactional
    @Operation(summary = "Criar novo funcionário", description = "Cria um novo funcionário no sistema")
    public Response criar(@Valid Funcionario funcionario) {
        // Validar CPF
        if (!Funcionario.isValidCpf(funcionario.cpf)) {
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity("CPF inválido")
                    .build();
        }

        // Verificar se já existe um funcionário com o mesmo CPF
        Funcionario funcionarioExistente = Funcionario.findByCpf(funcionario.cpf);
        if (funcionarioExistente != null) {
            return Response.status(Response.Status.CONFLICT)
                    .entity("Funcionário com este CPF já existe")
                    .build();
        }

        funcionario.persist();
        return Response.status(Response.Status.CREATED).entity(funcionario).build();
    }

    @PUT
    @Path("/{id}")
    @Transactional
    @Operation(summary = "Atualizar funcionário", description = "Atualiza um funcionário existente")
    public Response atualizar(@PathParam("id") Long id, @Valid Funcionario funcionarioAtualizado) {
        Funcionario funcionario = Funcionario.findById(id);
        if (funcionario == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        // Validar CPF
        if (!Funcionario.isValidCpf(funcionarioAtualizado.cpf)) {
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity("CPF inválido")
                    .build();
        }

        // Verificar se já existe outro funcionário com o mesmo CPF
        Funcionario funcionarioExistente = Funcionario.findByCpf(funcionarioAtualizado.cpf);
        if (funcionarioExistente != null && !funcionarioExistente.codigo.equals(id)) {
            return Response.status(Response.Status.CONFLICT)
                    .entity("Funcionário com este CPF já existe")
                    .build();
        }

        funcionario.nome = funcionarioAtualizado.nome;
        funcionario.cpf = funcionarioAtualizado.cpf;
        return Response.ok(funcionario).build();
    }

    @DELETE
    @Path("/{id}")
    @Transactional
    @Operation(summary = "Excluir funcionário", description = "Remove um funcionário do sistema")
    public Response excluir(@PathParam("id") Long id) {
        Funcionario funcionario = Funcionario.findById(id);
        if (funcionario == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        // Verificar se o funcionário tem vendas associadas
        if (funcionario.countVendas() > 0) {
            return Response.status(Response.Status.CONFLICT)
                    .entity("Não é possível excluir funcionário que possui vendas associadas")
                    .build();
        }

        funcionario.delete();
        return Response.noContent().build();
    }

    @GET
    @Path("/cpf/{cpf}")
    @Operation(summary = "Buscar funcionário por CPF", description = "Retorna um funcionário específico pelo seu CPF")
    public Response buscarPorCpf(@PathParam("cpf") String cpf) {
        Funcionario funcionario = Funcionario.findByCpf(cpf);
        if (funcionario == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(funcionario).build();
    }

    @GET
    @Path("/nome/{nome}")
    @Operation(summary = "Buscar funcionários por nome", description = "Retorna funcionários que contenham o nome especificado")
    public List<Funcionario> buscarPorNome(@PathParam("nome") String nome) {
        return Funcionario.findByNome(nome);
    }
}