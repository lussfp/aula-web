package br.com.loja.resource;

import br.com.loja.entity.Cliente;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.eclipse.microprofile.openapi.annotations.Operation;
import org.eclipse.microprofile.openapi.annotations.tags.Tag;

import java.util.List;

@Path("/clientes")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Tag(name = "Clientes", description = "Operações relacionadas aos clientes")
public class ClienteResource {

    @GET
    @Operation(summary = "Listar todos os clientes", description = "Retorna uma lista com todos os clientes cadastrados")
    public List<Cliente> listarTodos() {
        return Cliente.listAll();
    }

    @GET
    @Path("/{id}")
    @Operation(summary = "Buscar cliente por ID", description = "Retorna um cliente específico pelo seu ID")
    public Response buscarPorId(@PathParam("id") Long id) {
        Cliente cliente = Cliente.findById(id);
        if (cliente == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(cliente).build();
    }

    @POST
    @Transactional
    @Operation(summary = "Criar novo cliente", description = "Cria um novo cliente no sistema")
    public Response criar(@Valid Cliente cliente) {
        // Validar CPF
        if (!Cliente.isValidCpf(cliente.cpf)) {
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity("CPF inválido")
                    .build();
        }

        // Verificar se já existe um cliente com o mesmo CPF
        Cliente clienteExistente = Cliente.findByCpf(cliente.cpf);
        if (clienteExistente != null) {
            return Response.status(Response.Status.CONFLICT)
                    .entity("Cliente com este CPF já existe")
                    .build();
        }

        cliente.persist();
        return Response.status(Response.Status.CREATED).entity(cliente).build();
    }

    @PUT
    @Path("/{id}")
    @Transactional
    @Operation(summary = "Atualizar cliente", description = "Atualiza um cliente existente")
    public Response atualizar(@PathParam("id") Long id, @Valid Cliente clienteAtualizado) {
        Cliente cliente = Cliente.findById(id);
        if (cliente == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        // Validar CPF
        if (!Cliente.isValidCpf(clienteAtualizado.cpf)) {
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity("CPF inválido")
                    .build();
        }

        // Verificar se já existe outro cliente com o mesmo CPF
        Cliente clienteExistente = Cliente.findByCpf(clienteAtualizado.cpf);
        if (clienteExistente != null && !clienteExistente.codigo.equals(id)) {
            return Response.status(Response.Status.CONFLICT)
                    .entity("Cliente com este CPF já existe")
                    .build();
        }

        cliente.nome = clienteAtualizado.nome;
        cliente.cpf = clienteAtualizado.cpf;
        return Response.ok(cliente).build();
    }

    @DELETE
    @Path("/{id}")
    @Transactional
    @Operation(summary = "Excluir cliente", description = "Remove um cliente do sistema")
    public Response excluir(@PathParam("id") Long id) {
        Cliente cliente = Cliente.findById(id);
        if (cliente == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        // Verificar se o cliente tem compras associadas
        if (cliente.countCompras() > 0) {
            return Response.status(Response.Status.CONFLICT)
                    .entity("Não é possível excluir cliente que possui compras associadas")
                    .build();
        }

        cliente.delete();
        return Response.noContent().build();
    }

    @GET
    @Path("/cpf/{cpf}")
    @Operation(summary = "Buscar cliente por CPF", description = "Retorna um cliente específico pelo seu CPF")
    public Response buscarPorCpf(@PathParam("cpf") String cpf) {
        Cliente cliente = Cliente.findByCpf(cpf);
        if (cliente == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(cliente).build();
    }

    @GET
    @Path("/nome/{nome}")
    @Operation(summary = "Buscar clientes por nome", description = "Retorna clientes que contenham o nome especificado")
    public List<Cliente> buscarPorNome(@PathParam("nome") String nome) {
        return Cliente.findByNome(nome);
    }
}