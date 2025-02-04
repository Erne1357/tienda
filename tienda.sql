PGDMP     !                    |         	   bd_tienda    15.2    15.2 @    c           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            d           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            e           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            f           1262    25641 	   bd_tienda    DATABASE     }   CREATE DATABASE bd_tienda WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE bd_tienda;
                postgres    false            �            1259    26123    bitacora    TABLE     2  CREATE TABLE public.bitacora (
    id_bitacora bigint NOT NULL,
    tabla_afectada character varying(60) NOT NULL,
    operacion character varying(10) NOT NULL,
    usuario character varying(15) NOT NULL,
    fecha_modificacion timestamp without time zone NOT NULL,
    consulta_realizada text NOT NULL
);
    DROP TABLE public.bitacora;
       public         heap    postgres    false            �            1259    26122    bitacora_id_bitacora_seq    SEQUENCE     �   CREATE SEQUENCE public.bitacora_id_bitacora_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.bitacora_id_bitacora_seq;
       public          postgres    false    228            g           0    0    bitacora_id_bitacora_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.bitacora_id_bitacora_seq OWNED BY public.bitacora.id_bitacora;
          public          postgres    false    227            �            1259    26057 
   categorias    TABLE     �   CREATE TABLE public.categorias (
    id_categoria smallint NOT NULL,
    nombre_categoria character varying(25) NOT NULL,
    descripcion character varying(40)
);
    DROP TABLE public.categorias;
       public         heap    postgres    false            �            1259    26002    cliente_direcs    TABLE     #  CREATE TABLE public.cliente_direcs (
    id_cliente smallint NOT NULL,
    id_direccion smallint NOT NULL,
    calle character varying(20) NOT NULL,
    numero smallint NOT NULL,
    colonia character varying(20),
    ciudad character varying(20) NOT NULL,
    codigo_postal character(5)
);
 "   DROP TABLE public.cliente_direcs;
       public         heap    postgres    false            �            1259    25992    cliente_tels    TABLE     l   CREATE TABLE public.cliente_tels (
    id_cliente smallint NOT NULL,
    telefono character(10) NOT NULL
);
     DROP TABLE public.cliente_tels;
       public         heap    postgres    false            �            1259    25987    clientes    TABLE     �   CREATE TABLE public.clientes (
    id_cliente smallint NOT NULL,
    nombre character varying(25) NOT NULL,
    apaterno character varying(20) NOT NULL,
    amaterno character varying(20),
    preferencias character varying(30)
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    26097    entradas_producto    TABLE     �   CREATE TABLE public.entradas_producto (
    id_proveedor smallint NOT NULL,
    id_producto smallint NOT NULL,
    fecha_entrega timestamp without time zone NOT NULL,
    producto_malogrado boolean
);
 %   DROP TABLE public.entradas_producto;
       public         heap    postgres    false            �            1259    26052    marcas    TABLE     p   CREATE TABLE public.marcas (
    id_marca smallint NOT NULL,
    nombre_marca character varying(30) NOT NULL
);
    DROP TABLE public.marcas;
       public         heap    postgres    false            �            1259    26012    pagos    TABLE     �   CREATE TABLE public.pagos (
    id_pago smallint NOT NULL,
    id_cliente smallint NOT NULL,
    tipo_pago character varying(25),
    banco character varying(25) NOT NULL,
    numero_tarjeta character varying(25) NOT NULL
);
    DROP TABLE public.pagos;
       public         heap    postgres    false            �            1259    26062 	   productos    TABLE     l  CREATE TABLE public.productos (
    id_producto smallint NOT NULL,
    id_marca smallint NOT NULL,
    id_proveedor smallint NOT NULL,
    id_categoria smallint NOT NULL,
    nombre_producto character varying(25) NOT NULL,
    precio numeric(10,2) NOT NULL,
    impuesto numeric(10,2) NOT NULL,
    stock integer NOT NULL,
    descripcion character varying(40)
);
    DROP TABLE public.productos;
       public         heap    postgres    false            �            1259    26042    proveedor_direcs    TABLE     '  CREATE TABLE public.proveedor_direcs (
    id_direccion smallint NOT NULL,
    id_proveedor smallint NOT NULL,
    calle character varying(20) NOT NULL,
    numero smallint NOT NULL,
    colonia character varying(20),
    ciudad character varying(20) NOT NULL,
    codigo_postal character(5)
);
 $   DROP TABLE public.proveedor_direcs;
       public         heap    postgres    false            �            1259    26112    proveedor_tels    TABLE     p   CREATE TABLE public.proveedor_tels (
    id_proveedor smallint NOT NULL,
    telefono character(10) NOT NULL
);
 "   DROP TABLE public.proveedor_tels;
       public         heap    postgres    false            �            1259    26037    proveedores    TABLE     �   CREATE TABLE public.proveedores (
    id_proveedor smallint NOT NULL,
    nombre_proveedor character varying(50) NOT NULL,
    sitio_web character varying(70) NOT NULL
);
    DROP TABLE public.proveedores;
       public         heap    postgres    false            �            1259    26022    ventas    TABLE       CREATE TABLE public.ventas (
    id_venta smallint NOT NULL,
    id_cliente smallint NOT NULL,
    id_pago smallint NOT NULL,
    fecha timestamp without time zone NOT NULL,
    descuento numeric(10,2),
    total_impuesto numeric(10,2),
    monto_final numeric(10,2)
);
    DROP TABLE public.ventas;
       public         heap    postgres    false            �            1259    26082    ventas_detalle    TABLE     �   CREATE TABLE public.ventas_detalle (
    id_venta smallint NOT NULL,
    id_producto smallint NOT NULL,
    cantidad smallint NOT NULL,
    precio numeric(10,2) NOT NULL,
    parcial numeric(10,2) NOT NULL
);
 "   DROP TABLE public.ventas_detalle;
       public         heap    postgres    false            �           2604    26126    bitacora id_bitacora    DEFAULT     |   ALTER TABLE ONLY public.bitacora ALTER COLUMN id_bitacora SET DEFAULT nextval('public.bitacora_id_bitacora_seq'::regclass);
 C   ALTER TABLE public.bitacora ALTER COLUMN id_bitacora DROP DEFAULT;
       public          postgres    false    228    227    228            `          0    26123    bitacora 
   TABLE DATA           {   COPY public.bitacora (id_bitacora, tabla_afectada, operacion, usuario, fecha_modificacion, consulta_realizada) FROM stdin;
    public          postgres    false    228   �R       Z          0    26057 
   categorias 
   TABLE DATA           Q   COPY public.categorias (id_categoria, nombre_categoria, descripcion) FROM stdin;
    public          postgres    false    222   S       T          0    26002    cliente_direcs 
   TABLE DATA           q   COPY public.cliente_direcs (id_cliente, id_direccion, calle, numero, colonia, ciudad, codigo_postal) FROM stdin;
    public          postgres    false    216   %S       S          0    25992    cliente_tels 
   TABLE DATA           <   COPY public.cliente_tels (id_cliente, telefono) FROM stdin;
    public          postgres    false    215   BS       R          0    25987    clientes 
   TABLE DATA           X   COPY public.clientes (id_cliente, nombre, apaterno, amaterno, preferencias) FROM stdin;
    public          postgres    false    214   _S       ]          0    26097    entradas_producto 
   TABLE DATA           i   COPY public.entradas_producto (id_proveedor, id_producto, fecha_entrega, producto_malogrado) FROM stdin;
    public          postgres    false    225   |S       Y          0    26052    marcas 
   TABLE DATA           8   COPY public.marcas (id_marca, nombre_marca) FROM stdin;
    public          postgres    false    221   �S       U          0    26012    pagos 
   TABLE DATA           V   COPY public.pagos (id_pago, id_cliente, tipo_pago, banco, numero_tarjeta) FROM stdin;
    public          postgres    false    217   �S       [          0    26062 	   productos 
   TABLE DATA           �   COPY public.productos (id_producto, id_marca, id_proveedor, id_categoria, nombre_producto, precio, impuesto, stock, descripcion) FROM stdin;
    public          postgres    false    223   �S       X          0    26042    proveedor_direcs 
   TABLE DATA           u   COPY public.proveedor_direcs (id_direccion, id_proveedor, calle, numero, colonia, ciudad, codigo_postal) FROM stdin;
    public          postgres    false    220   �S       ^          0    26112    proveedor_tels 
   TABLE DATA           @   COPY public.proveedor_tels (id_proveedor, telefono) FROM stdin;
    public          postgres    false    226   T       W          0    26037    proveedores 
   TABLE DATA           P   COPY public.proveedores (id_proveedor, nombre_proveedor, sitio_web) FROM stdin;
    public          postgres    false    219   *T       V          0    26022    ventas 
   TABLE DATA           n   COPY public.ventas (id_venta, id_cliente, id_pago, fecha, descuento, total_impuesto, monto_final) FROM stdin;
    public          postgres    false    218   GT       \          0    26082    ventas_detalle 
   TABLE DATA           Z   COPY public.ventas_detalle (id_venta, id_producto, cantidad, precio, parcial) FROM stdin;
    public          postgres    false    224   dT       h           0    0    bitacora_id_bitacora_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.bitacora_id_bitacora_seq', 1, false);
          public          postgres    false    227            �           2606    26061    categorias pk_categorias 
   CONSTRAINT     `   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT pk_categorias PRIMARY KEY (id_categoria);
 B   ALTER TABLE ONLY public.categorias DROP CONSTRAINT pk_categorias;
       public            postgres    false    222            �           2606    26006    cliente_direcs pk_clien_direcs 
   CONSTRAINT     r   ALTER TABLE ONLY public.cliente_direcs
    ADD CONSTRAINT pk_clien_direcs PRIMARY KEY (id_direccion, id_cliente);
 H   ALTER TABLE ONLY public.cliente_direcs DROP CONSTRAINT pk_clien_direcs;
       public            postgres    false    216    216            �           2606    25996    cliente_tels pk_clien_tels 
   CONSTRAINT     j   ALTER TABLE ONLY public.cliente_tels
    ADD CONSTRAINT pk_clien_tels PRIMARY KEY (id_cliente, telefono);
 D   ALTER TABLE ONLY public.cliente_tels DROP CONSTRAINT pk_clien_tels;
       public            postgres    false    215    215            �           2606    25991    clientes pk_clientes 
   CONSTRAINT     Z   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT pk_clientes PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.clientes DROP CONSTRAINT pk_clientes;
       public            postgres    false    214            �           2606    26101 &   entradas_producto pk_entradas_producto 
   CONSTRAINT     �   ALTER TABLE ONLY public.entradas_producto
    ADD CONSTRAINT pk_entradas_producto PRIMARY KEY (id_proveedor, id_producto, fecha_entrega);
 P   ALTER TABLE ONLY public.entradas_producto DROP CONSTRAINT pk_entradas_producto;
       public            postgres    false    225    225    225            �           2606    26130    bitacora pk_id_bitacora 
   CONSTRAINT     ^   ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT pk_id_bitacora PRIMARY KEY (id_bitacora);
 A   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT pk_id_bitacora;
       public            postgres    false    228            �           2606    26056    marcas pk_marcas 
   CONSTRAINT     T   ALTER TABLE ONLY public.marcas
    ADD CONSTRAINT pk_marcas PRIMARY KEY (id_marca);
 :   ALTER TABLE ONLY public.marcas DROP CONSTRAINT pk_marcas;
       public            postgres    false    221            �           2606    26016    pagos pk_pagos 
   CONSTRAINT     Q   ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pk_pagos PRIMARY KEY (id_pago);
 8   ALTER TABLE ONLY public.pagos DROP CONSTRAINT pk_pagos;
       public            postgres    false    217            �           2606    26066    productos pk_productos 
   CONSTRAINT     ]   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT pk_productos PRIMARY KEY (id_producto);
 @   ALTER TABLE ONLY public.productos DROP CONSTRAINT pk_productos;
       public            postgres    false    223            �           2606    26046 $   proveedor_direcs pk_proveedor_direcs 
   CONSTRAINT     z   ALTER TABLE ONLY public.proveedor_direcs
    ADD CONSTRAINT pk_proveedor_direcs PRIMARY KEY (id_direccion, id_proveedor);
 N   ALTER TABLE ONLY public.proveedor_direcs DROP CONSTRAINT pk_proveedor_direcs;
       public            postgres    false    220    220            �           2606    26116     proveedor_tels pk_proveedor_tels 
   CONSTRAINT     r   ALTER TABLE ONLY public.proveedor_tels
    ADD CONSTRAINT pk_proveedor_tels PRIMARY KEY (id_proveedor, telefono);
 J   ALTER TABLE ONLY public.proveedor_tels DROP CONSTRAINT pk_proveedor_tels;
       public            postgres    false    226    226            �           2606    26041    proveedores pk_proveedores 
   CONSTRAINT     b   ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT pk_proveedores PRIMARY KEY (id_proveedor);
 D   ALTER TABLE ONLY public.proveedores DROP CONSTRAINT pk_proveedores;
       public            postgres    false    219            �           2606    26026    ventas pk_ventas 
   CONSTRAINT     T   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT pk_ventas PRIMARY KEY (id_venta);
 :   ALTER TABLE ONLY public.ventas DROP CONSTRAINT pk_ventas;
       public            postgres    false    218            �           2606    26086     ventas_detalle pk_ventas_detalle 
   CONSTRAINT     q   ALTER TABLE ONLY public.ventas_detalle
    ADD CONSTRAINT pk_ventas_detalle PRIMARY KEY (id_venta, id_producto);
 J   ALTER TABLE ONLY public.ventas_detalle DROP CONSTRAINT pk_ventas_detalle;
       public            postgres    false    224    224            �           2606    26007 )   cliente_direcs fk_clientes_cliente_direcs    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente_direcs
    ADD CONSTRAINT fk_clientes_cliente_direcs FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente);
 S   ALTER TABLE ONLY public.cliente_direcs DROP CONSTRAINT fk_clientes_cliente_direcs;
       public          postgres    false    214    3227    216            �           2606    25997 %   cliente_tels fk_clientes_cliente_tels    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente_tels
    ADD CONSTRAINT fk_clientes_cliente_tels FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente);
 O   ALTER TABLE ONLY public.cliente_tels DROP CONSTRAINT fk_clientes_cliente_tels;
       public          postgres    false    215    214    3227            �           2606    26107 0   entradas_producto fk_entradas_producto_productos    FK CONSTRAINT     �   ALTER TABLE ONLY public.entradas_producto
    ADD CONSTRAINT fk_entradas_producto_productos FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);
 Z   ALTER TABLE ONLY public.entradas_producto DROP CONSTRAINT fk_entradas_producto_productos;
       public          postgres    false    3245    225    223            �           2606    26102 2   entradas_producto fk_entradas_producto_proveedores    FK CONSTRAINT     �   ALTER TABLE ONLY public.entradas_producto
    ADD CONSTRAINT fk_entradas_producto_proveedores FOREIGN KEY (id_proveedor) REFERENCES public.proveedores(id_proveedor);
 \   ALTER TABLE ONLY public.entradas_producto DROP CONSTRAINT fk_entradas_producto_proveedores;
       public          postgres    false    219    3237    225            �           2606    26017    pagos fk_pagos_clientes    FK CONSTRAINT     �   ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT fk_pagos_clientes FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente);
 A   ALTER TABLE ONLY public.pagos DROP CONSTRAINT fk_pagos_clientes;
       public          postgres    false    3227    217    214            �           2606    26077 !   productos fk_productos_categorias    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_categorias FOREIGN KEY (id_categoria) REFERENCES public.categorias(id_categoria);
 K   ALTER TABLE ONLY public.productos DROP CONSTRAINT fk_productos_categorias;
       public          postgres    false    223    222    3243            �           2606    26067    productos fk_productos_marca    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_marca FOREIGN KEY (id_marca) REFERENCES public.marcas(id_marca);
 F   ALTER TABLE ONLY public.productos DROP CONSTRAINT fk_productos_marca;
       public          postgres    false    3241    223    221            �           2606    26072 "   productos fk_productos_proveedores    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_proveedores FOREIGN KEY (id_proveedor) REFERENCES public.proveedores(id_proveedor);
 L   ALTER TABLE ONLY public.productos DROP CONSTRAINT fk_productos_proveedores;
       public          postgres    false    223    219    3237            �           2606    26047 0   proveedor_direcs fk_proveedor_direcs_proveedores    FK CONSTRAINT     �   ALTER TABLE ONLY public.proveedor_direcs
    ADD CONSTRAINT fk_proveedor_direcs_proveedores FOREIGN KEY (id_proveedor) REFERENCES public.proveedores(id_proveedor);
 Z   ALTER TABLE ONLY public.proveedor_direcs DROP CONSTRAINT fk_proveedor_direcs_proveedores;
       public          postgres    false    220    219    3237            �           2606    26117 ,   proveedor_tels fk_proveedor_tels_proveedores    FK CONSTRAINT     �   ALTER TABLE ONLY public.proveedor_tels
    ADD CONSTRAINT fk_proveedor_tels_proveedores FOREIGN KEY (id_proveedor) REFERENCES public.proveedores(id_proveedor);
 V   ALTER TABLE ONLY public.proveedor_tels DROP CONSTRAINT fk_proveedor_tels_proveedores;
       public          postgres    false    226    219    3237            �           2606    26027    ventas fk_ventas_clientes    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_ventas_clientes FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente);
 C   ALTER TABLE ONLY public.ventas DROP CONSTRAINT fk_ventas_clientes;
       public          postgres    false    3227    218    214            �           2606    26092 *   ventas_detalle fk_ventas_detalle_productos    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas_detalle
    ADD CONSTRAINT fk_ventas_detalle_productos FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);
 T   ALTER TABLE ONLY public.ventas_detalle DROP CONSTRAINT fk_ventas_detalle_productos;
       public          postgres    false    223    224    3245            �           2606    26087 '   ventas_detalle fk_ventas_detalle_ventas    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas_detalle
    ADD CONSTRAINT fk_ventas_detalle_ventas FOREIGN KEY (id_venta) REFERENCES public.ventas(id_venta);
 Q   ALTER TABLE ONLY public.ventas_detalle DROP CONSTRAINT fk_ventas_detalle_ventas;
       public          postgres    false    218    224    3235            �           2606    26032    ventas fk_ventas_pagos    FK CONSTRAINT     z   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_ventas_pagos FOREIGN KEY (id_pago) REFERENCES public.pagos(id_pago);
 @   ALTER TABLE ONLY public.ventas DROP CONSTRAINT fk_ventas_pagos;
       public          postgres    false    217    218    3233            `      x������ � �      Z      x������ � �      T      x������ � �      S      x������ � �      R      x������ � �      ]      x������ � �      Y      x������ � �      U      x������ � �      [      x������ � �      X      x������ � �      ^      x������ � �      W      x������ � �      V      x������ � �      \      x������ � �     