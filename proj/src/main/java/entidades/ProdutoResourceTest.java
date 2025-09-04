package br.com.loja.resource;

import io.quarkus.test.junit.QuarkusTest;
import io.restassured.http.ContentType;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.greaterThan;

@QuarkusTest
public class ProdutoResourceTest {

    @Test
    public void testListarTodosProdutos() {
        given()
                .when().get("/produtos")
                .then()
                .statusCode(200)
                .body("size()", greaterThan(0));
    }

    @Test
    public void testBuscarProdutoPorId() {
        given()
                .when().get("/produtos/1")
                .then()
                .statusCode(200)
                .body("codigo", is(1))
                .body("nome", is("Smartphone Galaxy S24"));
    }

    @Test
    public void testBuscarProdutoInexistente() {
        given()
                .when().get("/produtos/999")
                .then()
                .statusCode(404);
    }

    @Test
    public void testCriarProduto() {
        String novoProduto = """
            {
                "nome": "Notebook Dell",
                "preco": 2500.00,
                "quantidade": 5,
                "validade": "2025-12-31",
                "categoria": {"codigo": 1},
                "fabricante": {"codigo": 1}
            }
        """;

        given()
                .contentType(ContentType.JSON)
                .body(novoProduto)
                .when().post("/produtos")
                .then()
                .statusCode(201)
                .body("nome", is("Notebook Dell"))
                .body("preco", is(2500.00f));
    }

    @Test
    public void testCriarProdutoInvalido() {
        String produtoInvalido = """
            {
                "nome": "",
                "preco": -100.00,
                "quantidade": -5
            }
        """;

        given()
                .contentType(ContentType.JSON)
                .body(produtoInvalido)
                .when().post("/produtos")
                .then()
                .statusCode(400);
    }

    @Test
    public void testBuscarProdutosPorNome() {
        given()
                .when().get("/produtos/nome/Samsung")
                .then()
                .statusCode(200)
                .body("size()", greaterThan(0));
    }

    @Test
    public void testBuscarProdutosEstoqueBaixo() {
        given()
                .when().get("/produtos/estoque-baixo/10")
                .then()
                .statusCode(200);
    }

    @Test
    public void testAtualizarProduto() {
        String produtoAtualizado = """
            {
                "nome": "Smartphone Galaxy S24 Pro",
                "preco": 2800.00,
                "quantidade": 8,
                "validade": "2025-12-31",
                "categoria": {"codigo": 1},
                "fabricante": {"codigo": 1}
            }
        """;

        given()
                .contentType(ContentType.JSON)
                .body(produtoAtualizado)
                .when().put("/produtos/1")
                .then()
                .statusCode(200)
                .body("nome", is("Smartphone Galaxy S24 Pro"))
                .body("preco", is(2800.00f));
    }

    @Test
    public void testExcluirProdutoInexistente() {
        given()
                .when().delete("/produtos/999")
                .then()
                .statusCode(404);
    }
}