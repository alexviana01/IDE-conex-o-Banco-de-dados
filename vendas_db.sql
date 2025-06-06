PGDMP      	                }         	   vendas_db    17.5    17.5 )    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    32994 	   vendas_db    DATABASE     �   CREATE DATABASE vendas_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE vendas_db;
                     postgres    false            �            1259    32996    clientes    TABLE     �   CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nome character varying(255) NOT NULL,
    cpf character varying(22) NOT NULL,
    email character varying(255),
    telefone character varying(20),
    endereco text
);
    DROP TABLE public.clientes;
       public         heap r       postgres    false            �            1259    32995    clientes_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.clientes_id_cliente_seq;
       public               postgres    false    218            �           0    0    clientes_id_cliente_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;
          public               postgres    false    217            �            1259    33038    itensnotafiscal    TABLE     �  CREATE TABLE public.itensnotafiscal (
    id_item_nf integer NOT NULL,
    id_notafiscal integer NOT NULL,
    id_produto integer NOT NULL,
    quantidade integer NOT NULL,
    preco_unitario_venda numeric(10,2) NOT NULL,
    CONSTRAINT itensnotafiscal_preco_unitario_venda_check CHECK ((preco_unitario_venda >= (0)::numeric)),
    CONSTRAINT itensnotafiscal_quantidade_check CHECK ((quantidade > 0))
);
 #   DROP TABLE public.itensnotafiscal;
       public         heap r       postgres    false            �            1259    33037    itensnotafiscal_id_item_nf_seq    SEQUENCE     �   CREATE SEQUENCE public.itensnotafiscal_id_item_nf_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.itensnotafiscal_id_item_nf_seq;
       public               postgres    false    224            �           0    0    itensnotafiscal_id_item_nf_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.itensnotafiscal_id_item_nf_seq OWNED BY public.itensnotafiscal.id_item_nf;
          public               postgres    false    223            �            1259    33021    notasfiscais    TABLE     a  CREATE TABLE public.notasfiscais (
    id_notafiscal integer NOT NULL,
    id_cliente integer NOT NULL,
    numero_nf character varying(50) NOT NULL,
    data_emissao timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    valor_total numeric(12,2) DEFAULT 0.00,
    CONSTRAINT notasfiscais_valor_total_check CHECK ((valor_total >= (0)::numeric))
);
     DROP TABLE public.notasfiscais;
       public         heap r       postgres    false            �            1259    33020    notasfiscais_id_notafiscal_seq    SEQUENCE     �   CREATE SEQUENCE public.notasfiscais_id_notafiscal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.notasfiscais_id_notafiscal_seq;
       public               postgres    false    222            �           0    0    notasfiscais_id_notafiscal_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.notasfiscais_id_notafiscal_seq OWNED BY public.notasfiscais.id_notafiscal;
          public               postgres    false    221            �            1259    33009    produtos    TABLE     D  CREATE TABLE public.produtos (
    id_produto integer NOT NULL,
    nome character varying(255) NOT NULL,
    descricao text,
    preco numeric(10,2) NOT NULL,
    estoque integer DEFAULT 0,
    CONSTRAINT produtos_estoque_check CHECK ((estoque >= 0)),
    CONSTRAINT produtos_preco_check CHECK ((preco >= (0)::numeric))
);
    DROP TABLE public.produtos;
       public         heap r       postgres    false            �            1259    33008    produtos_id_produto_seq    SEQUENCE     �   CREATE SEQUENCE public.produtos_id_produto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.produtos_id_produto_seq;
       public               postgres    false    220            �           0    0    produtos_id_produto_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.produtos_id_produto_seq OWNED BY public.produtos.id_produto;
          public               postgres    false    219            0           2604    32999    clientes id_cliente    DEFAULT     z   ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);
 B   ALTER TABLE public.clientes ALTER COLUMN id_cliente DROP DEFAULT;
       public               postgres    false    218    217    218            6           2604    33041    itensnotafiscal id_item_nf    DEFAULT     �   ALTER TABLE ONLY public.itensnotafiscal ALTER COLUMN id_item_nf SET DEFAULT nextval('public.itensnotafiscal_id_item_nf_seq'::regclass);
 I   ALTER TABLE public.itensnotafiscal ALTER COLUMN id_item_nf DROP DEFAULT;
       public               postgres    false    224    223    224            3           2604    33024    notasfiscais id_notafiscal    DEFAULT     �   ALTER TABLE ONLY public.notasfiscais ALTER COLUMN id_notafiscal SET DEFAULT nextval('public.notasfiscais_id_notafiscal_seq'::regclass);
 I   ALTER TABLE public.notasfiscais ALTER COLUMN id_notafiscal DROP DEFAULT;
       public               postgres    false    222    221    222            1           2604    33012    produtos id_produto    DEFAULT     z   ALTER TABLE ONLY public.produtos ALTER COLUMN id_produto SET DEFAULT nextval('public.produtos_id_produto_seq'::regclass);
 B   ALTER TABLE public.produtos ALTER COLUMN id_produto DROP DEFAULT;
       public               postgres    false    220    219    220            �          0    32996    clientes 
   TABLE DATA           T   COPY public.clientes (id_cliente, nome, cpf, email, telefone, endereco) FROM stdin;
    public               postgres    false    218   o3       �          0    33038    itensnotafiscal 
   TABLE DATA           r   COPY public.itensnotafiscal (id_item_nf, id_notafiscal, id_produto, quantidade, preco_unitario_venda) FROM stdin;
    public               postgres    false    224   �3       �          0    33021    notasfiscais 
   TABLE DATA           g   COPY public.notasfiscais (id_notafiscal, id_cliente, numero_nf, data_emissao, valor_total) FROM stdin;
    public               postgres    false    222   �3       �          0    33009    produtos 
   TABLE DATA           O   COPY public.produtos (id_produto, nome, descricao, preco, estoque) FROM stdin;
    public               postgres    false    220   4       �           0    0    clientes_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 1, true);
          public               postgres    false    217            �           0    0    itensnotafiscal_id_item_nf_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.itensnotafiscal_id_item_nf_seq', 1, false);
          public               postgres    false    223            �           0    0    notasfiscais_id_notafiscal_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.notasfiscais_id_notafiscal_seq', 1, false);
          public               postgres    false    221            �           0    0    produtos_id_produto_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.produtos_id_produto_seq', 1, false);
          public               postgres    false    219            =           2606    33061    clientes clientes_cpf_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_cpf_key UNIQUE (cpf);
 C   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_cpf_key;
       public                 postgres    false    218            ?           2606    33007    clientes clientes_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_email_key;
       public                 postgres    false    218            A           2606    33003    clientes clientes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public                 postgres    false    218            L           2606    33045 $   itensnotafiscal itensnotafiscal_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.itensnotafiscal
    ADD CONSTRAINT itensnotafiscal_pkey PRIMARY KEY (id_item_nf);
 N   ALTER TABLE ONLY public.itensnotafiscal DROP CONSTRAINT itensnotafiscal_pkey;
       public                 postgres    false    224            H           2606    33031 '   notasfiscais notasfiscais_numero_nf_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.notasfiscais
    ADD CONSTRAINT notasfiscais_numero_nf_key UNIQUE (numero_nf);
 Q   ALTER TABLE ONLY public.notasfiscais DROP CONSTRAINT notasfiscais_numero_nf_key;
       public                 postgres    false    222            J           2606    33029    notasfiscais notasfiscais_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.notasfiscais
    ADD CONSTRAINT notasfiscais_pkey PRIMARY KEY (id_notafiscal);
 H   ALTER TABLE ONLY public.notasfiscais DROP CONSTRAINT notasfiscais_pkey;
       public                 postgres    false    222            E           2606    33019    produtos produtos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id_produto);
 @   ALTER TABLE ONLY public.produtos DROP CONSTRAINT produtos_pkey;
       public                 postgres    false    220            B           1259    33056    idx_clientes_nome    INDEX     F   CREATE INDEX idx_clientes_nome ON public.clientes USING btree (nome);
 %   DROP INDEX public.idx_clientes_nome;
       public                 postgres    false    218            F           1259    33058    idx_notasfiscais_data_emissao    INDEX     ^   CREATE INDEX idx_notasfiscais_data_emissao ON public.notasfiscais USING btree (data_emissao);
 1   DROP INDEX public.idx_notasfiscais_data_emissao;
       public                 postgres    false    222            C           1259    33057    idx_produtos_nome    INDEX     F   CREATE INDEX idx_produtos_nome ON public.produtos USING btree (nome);
 %   DROP INDEX public.idx_produtos_nome;
       public                 postgres    false    220            M           2606    33032    notasfiscais fk_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.notasfiscais
    ADD CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) ON DELETE RESTRICT;
 A   ALTER TABLE ONLY public.notasfiscais DROP CONSTRAINT fk_cliente;
       public               postgres    false    222    4673    218            N           2606    33046 "   itensnotafiscal fk_notafiscal_item    FK CONSTRAINT     �   ALTER TABLE ONLY public.itensnotafiscal
    ADD CONSTRAINT fk_notafiscal_item FOREIGN KEY (id_notafiscal) REFERENCES public.notasfiscais(id_notafiscal) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.itensnotafiscal DROP CONSTRAINT fk_notafiscal_item;
       public               postgres    false    224    222    4682            O           2606    33051    itensnotafiscal fk_produto_item    FK CONSTRAINT     �   ALTER TABLE ONLY public.itensnotafiscal
    ADD CONSTRAINT fk_produto_item FOREIGN KEY (id_produto) REFERENCES public.produtos(id_produto) ON DELETE RESTRICT;
 I   ALTER TABLE ONLY public.itensnotafiscal DROP CONSTRAINT fk_produto_item;
       public               postgres    false    4677    224    220            �   M   x�3�L�I��422҃b]scN���l��Ģ�����ļD��������\N#CKss33SS���Ģ�L�=... ��      �      x������ � �      �      x������ � �      �      x������ � �     