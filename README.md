## Introducción

El propósito de este proyecto es ayudarte a familiarizarte con el Ruby, Ruby On Rails y las gemas que usamos para el desarrollo de la API de Wisboo.

Este proyecto está divido en un checklist de funcionalidades que debes desarrollar, cada uno de los items del checklist está pensado para que puedas incorporar el conocimiento básico para luego comenzar a contribuir en el proyecto del backend.

## Stack utilizado

- Ruby 2.5.8
- Ruby On Rails 4.2.11.1
- PostgreSQL 12
- Redis

Nota: Utilizamos versiones antiguas de Ruby y Ruby on Rails porque estamos usando las mismas versiones que el proyecto real.

## Contexto

El objetivo es desarrollar una API Rest utilizando Ruby On Rails, la cual nos permita llevar el inventario de tienda online

## Checklist Instalación 
- Clonar proyecto
- Instalar Rbenv
- Instalar Ruby
- Instalar PostgreSQL
- Instalar Redis
- Instalar dependencias con el comando `bundle install`
- Crear y llenar la BD con el siguiente comando `rake db:create db:migrate db:seed`
- Ejecutar el proyecto `rails s`

## Checklist de implementación

### 1. Agregar migraciones
Se debe crear las migraciones para agregar las tablas faltantes.
![mer](https://user-images.githubusercontent.com/5251813/135779800-f81d7967-30af-45fb-8e3b-526940ff5437.png)

### 2. Agregar modelos
Se deben agregar los modelos faltantes al proyecto, incluyendo validaciones y relaciones.

### 3. Agregar endpoints CRUD para un producto digital

Para este item es necesario que agregues 4 endpoints nuevos que permitan realizar acciones CRUD sobre el modelo Product. Estos endpoints son:

**GET** /products?size=10&page=1&query=aa
_Este endpoint permite listar los productos de manera paginada, para esto recibimos los parámetros page (Por defecto 1) y size (Por defecto 10). También es posible filtrar los productos por su nombre o descripción según el valor que contenga el parámetro query_

Respuesta:
Código 200 - OK
````
    {
      metadata: {
        total_record_count: 10,
        page_size: 10,
        page_number: 1
      },
      products: [
        {
          id: 1,
          name: "",
          description: "",
          image: "",
          quantity: 5
        },
        ...
      ]
    }
````

**GET** /products/:id
_Este endpoint permite obtener los datos de un producto específico_

Respuesta:
Código 200 - OK
````
    {
      id: 1,
      name: "",
      description: "",
      image: "",
      quantity: 5
    }
````

**POST** /products
_Este endpoint permite crear un nuevo producto, **solo los usuarios de tipo administrador pueden crear un nuevo producto**_

Respuesta:
Código 201 - Created
````
    {
      id: 1,
      name: "",
      description: "",
      image: "",
      quantity: 5
    }
````

**PUT** /products/:id
_Este endpoint permite editar un producto, **solo los usuarios de tipo administrador pueden crear un nuevo producto**_

Respuesta:
Código 200 - OK
````
    {
      id: 1,
      name: "",
      description: "",
      image: "",
      quantity: 5
    }
````

**DELETE** /products/:id
_Este endpoint permite eliminar un producto, **solo los usuarios de tipo administrador pueden crear un nuevo producto**_

Respuesta:
Código 204 - No content


Para completar este item es necesario conocer:
 - Como crear rutas (https://wisboo.atlassian.net/wiki/spaces/AW/pages/404029484/Rutas+en+rails)
 - Controladores (https://wisboo.atlassian.net/wiki/spaces/AW/pages/403963937/Controladores+en+Rails)
 - Policies (https://wisboo.atlassian.net/wiki/spaces/AW/pages/1190330429/Policies)
 - Queries (https://wisboo.atlassian.net/wiki/spaces/AW/pages/1190101026/Queries)
 - Serializadores (https://wisboo.atlassian.net/wiki/spaces/AW/pages/407011341/Serializers)

### 4. Agregar endpoint para agregar un producto al Wishlist:

Para completar este item debes agregar un nuevo endpoint que permita agregar un producto al wishlist del usuario actualmente logueado.

**POST** /wishlist_entries
_Body_
````
  {
    product_id: 1
  }
````
_Respuesta:_
Código 204 - No content

Una vez completado el endpoint se debe regresar al endpoint para editar un producto y agregar la siguiente funcionalidad: Cuando se modifique la cantidad de items disponibles del producto y se pase de 0 a cualquier cantidad se debe disparar un email a los usuarios que tienen el producto en su wishlist para notificarles que está disponible.

Para completar este item es necesario conocer:
 - Envío de emails (https://wisboo.atlassian.net/wiki/spaces/AW/pages/1198260225/Env+o+de+emails)
 - Trabajos asíncronos (https://wisboo.atlassian.net/wiki/spaces/AW/pages/1198260232/Trabajos+as+ncronos)

### 5. Agregar tests para los endpoints
Se deben crean tests para al menos 2 endpoints, puedes usar esta guía para aprender más de rspec y tests unitarios. https://wisboo.atlassian.net/wiki/spaces/AW/pages/416874526/RSpec+101
