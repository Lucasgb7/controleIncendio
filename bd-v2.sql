PGDMP                         w            controle_incendio #   10.8 (Ubuntu 10.8-0ubuntu0.18.04.1) #   10.8 (Ubuntu 10.8-0ubuntu0.18.04.1) A    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16972    controle_incendio    DATABASE     �   CREATE DATABASE controle_incendio WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
 !   DROP DATABASE controle_incendio;
             postgres    false                        2615    17886    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                        3079    13041    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    17889    cliente_final    TABLE     �   CREATE TABLE public.cliente_final (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    servico_seguranca_id integer NOT NULL,
    tipo_pessoa character(1) DEFAULT 'f'::bpchar NOT NULL,
    ativo boolean DEFAULT true NOT NULL
);
 !   DROP TABLE public.cliente_final;
       public         postgres    false    7            �            1259    17887    cliente_final_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_final_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.cliente_final_id_seq;
       public       postgres    false    7    197            �           0    0    cliente_final_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.cliente_final_id_seq OWNED BY public.cliente_final.id;
            public       postgres    false    196            �            1259    17897    endereco    TABLE     ~  CREATE TABLE public.endereco (
    id integer NOT NULL,
    cep character(8) NOT NULL,
    logradouro character varying(255) NOT NULL,
    numero character varying(255) NOT NULL,
    referencia character varying(255),
    bairro character varying(255) NOT NULL,
    municipio character varying(255) NOT NULL,
    uf character(2) NOT NULL,
    ativo boolean DEFAULT true NOT NULL
);
    DROP TABLE public.endereco;
       public         postgres    false    7            �            1259    17895    endereco_id_seq    SEQUENCE     �   CREATE SEQUENCE public.endereco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.endereco_id_seq;
       public       postgres    false    199    7            �           0    0    endereco_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.endereco_id_seq OWNED BY public.endereco.id;
            public       postgres    false    198            �            1259    17908 
   instalacao    TABLE     �   CREATE TABLE public.instalacao (
    id integer NOT NULL,
    data_instalacao date NOT NULL,
    cliente_final_id integer NOT NULL,
    endereco_id integer NOT NULL,
    dispositivo integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL
);
    DROP TABLE public.instalacao;
       public         postgres    false    7            �            1259    17906    instalacao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.instalacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.instalacao_id_seq;
       public       postgres    false    201    7            �           0    0    instalacao_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.instalacao_id_seq OWNED BY public.instalacao.id;
            public       postgres    false    200            �            1259    17918 
   ocorrencia    TABLE     
  CREATE TABLE public.ocorrencia (
    id integer NOT NULL,
    data_ocorrencia timestamp without time zone NOT NULL,
    temperatura numeric(5,2) NOT NULL,
    densidade_fumaca numeric(5,2) NOT NULL,
    instalacao_id integer NOT NULL,
    estado integer NOT NULL
);
    DROP TABLE public.ocorrencia;
       public         postgres    false    7            �            1259    17916    ocorrencia_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ocorrencia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.ocorrencia_id_seq;
       public       postgres    false    7    203            �           0    0    ocorrencia_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.ocorrencia_id_seq OWNED BY public.ocorrencia.id;
            public       postgres    false    202            �            1259    17924    pessoa_fisica    TABLE     g   CREATE TABLE public.pessoa_fisica (
    cliente_id integer NOT NULL,
    cpf character(11) NOT NULL
);
 !   DROP TABLE public.pessoa_fisica;
       public         postgres    false    7            �            1259    17931    pessoa_juridica    TABLE     j   CREATE TABLE public.pessoa_juridica (
    cliente_id integer NOT NULL,
    cnpj character(15) NOT NULL
);
 #   DROP TABLE public.pessoa_juridica;
       public         postgres    false    7            �            1259    17940    servico_seguranca    TABLE     �   CREATE TABLE public.servico_seguranca (
    id integer NOT NULL,
    usuario character varying(255) NOT NULL,
    senha character varying(40) NOT NULL
);
 %   DROP TABLE public.servico_seguranca;
       public         postgres    false    7            �            1259    17938    servico_seguranca_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servico_seguranca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.servico_seguranca_id_seq;
       public       postgres    false    7    207            �           0    0    servico_seguranca_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.servico_seguranca_id_seq OWNED BY public.servico_seguranca.id;
            public       postgres    false    206            �            1259    17948    telefone_associado    TABLE     �   CREATE TABLE public.telefone_associado (
    id integer NOT NULL,
    numero character(11) NOT NULL,
    cliente_id integer NOT NULL
);
 &   DROP TABLE public.telefone_associado;
       public         postgres    false    7            �            1259    17946    telefone_associado_id_seq    SEQUENCE     �   CREATE SEQUENCE public.telefone_associado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.telefone_associado_id_seq;
       public       postgres    false    7    209            �           0    0    telefone_associado_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.telefone_associado_id_seq OWNED BY public.telefone_associado.id;
            public       postgres    false    208            	           2604    17892    cliente_final id    DEFAULT     t   ALTER TABLE ONLY public.cliente_final ALTER COLUMN id SET DEFAULT nextval('public.cliente_final_id_seq'::regclass);
 ?   ALTER TABLE public.cliente_final ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197                       2604    17900    endereco id    DEFAULT     j   ALTER TABLE ONLY public.endereco ALTER COLUMN id SET DEFAULT nextval('public.endereco_id_seq'::regclass);
 :   ALTER TABLE public.endereco ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    199    199                       2604    17911    instalacao id    DEFAULT     n   ALTER TABLE ONLY public.instalacao ALTER COLUMN id SET DEFAULT nextval('public.instalacao_id_seq'::regclass);
 <   ALTER TABLE public.instalacao ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    201    201                       2604    17921    ocorrencia id    DEFAULT     n   ALTER TABLE ONLY public.ocorrencia ALTER COLUMN id SET DEFAULT nextval('public.ocorrencia_id_seq'::regclass);
 <   ALTER TABLE public.ocorrencia ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202    203                       2604    17943    servico_seguranca id    DEFAULT     |   ALTER TABLE ONLY public.servico_seguranca ALTER COLUMN id SET DEFAULT nextval('public.servico_seguranca_id_seq'::regclass);
 C   ALTER TABLE public.servico_seguranca ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206    207                       2604    17951    telefone_associado id    DEFAULT     ~   ALTER TABLE ONLY public.telefone_associado ALTER COLUMN id SET DEFAULT nextval('public.telefone_associado_id_seq'::regclass);
 D   ALTER TABLE public.telefone_associado ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208    209            �          0    17889    cliente_final 
   TABLE DATA               [   COPY public.cliente_final (id, nome, servico_seguranca_id, tipo_pessoa, ativo) FROM stdin;
    public       postgres    false    197   UK       �          0    17897    endereco 
   TABLE DATA               i   COPY public.endereco (id, cep, logradouro, numero, referencia, bairro, municipio, uf, ativo) FROM stdin;
    public       postgres    false    199   �K       �          0    17908 
   instalacao 
   TABLE DATA               l   COPY public.instalacao (id, data_instalacao, cliente_final_id, endereco_id, dispositivo, ativo) FROM stdin;
    public       postgres    false    201   �L       �          0    17918 
   ocorrencia 
   TABLE DATA               o   COPY public.ocorrencia (id, data_ocorrencia, temperatura, densidade_fumaca, instalacao_id, estado) FROM stdin;
    public       postgres    false    203   �L       �          0    17924    pessoa_fisica 
   TABLE DATA               8   COPY public.pessoa_fisica (cliente_id, cpf) FROM stdin;
    public       postgres    false    204   QM       �          0    17931    pessoa_juridica 
   TABLE DATA               ;   COPY public.pessoa_juridica (cliente_id, cnpj) FROM stdin;
    public       postgres    false    205   �M       �          0    17940    servico_seguranca 
   TABLE DATA               ?   COPY public.servico_seguranca (id, usuario, senha) FROM stdin;
    public       postgres    false    207   �M       �          0    17948    telefone_associado 
   TABLE DATA               D   COPY public.telefone_associado (id, numero, cliente_id) FROM stdin;
    public       postgres    false    209   �M       �           0    0    cliente_final_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.cliente_final_id_seq', 7, true);
            public       postgres    false    196            �           0    0    endereco_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.endereco_id_seq', 11, true);
            public       postgres    false    198            �           0    0    instalacao_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.instalacao_id_seq', 9, true);
            public       postgres    false    200            �           0    0    ocorrencia_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.ocorrencia_id_seq', 1, false);
            public       postgres    false    202            �           0    0    servico_seguranca_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.servico_seguranca_id_seq', 1, false);
            public       postgres    false    206            �           0    0    telefone_associado_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.telefone_associado_id_seq', 1, false);
            public       postgres    false    208                       2606    17894    cliente_final cliente_final_pk 
   CONSTRAINT     \   ALTER TABLE ONLY public.cliente_final
    ADD CONSTRAINT cliente_final_pk PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.cliente_final DROP CONSTRAINT cliente_final_pk;
       public         postgres    false    197            "           2606    17937    pessoa_juridica cnpj_unique 
   CONSTRAINT     V   ALTER TABLE ONLY public.pessoa_juridica
    ADD CONSTRAINT cnpj_unique UNIQUE (cnpj);
 E   ALTER TABLE ONLY public.pessoa_juridica DROP CONSTRAINT cnpj_unique;
       public         postgres    false    205                       2606    17930    pessoa_fisica cpf_unique 
   CONSTRAINT     R   ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT cpf_unique UNIQUE (cpf);
 B   ALTER TABLE ONLY public.pessoa_fisica DROP CONSTRAINT cpf_unique;
       public         postgres    false    204                       2606    17915    instalacao dispositivo_unique 
   CONSTRAINT     _   ALTER TABLE ONLY public.instalacao
    ADD CONSTRAINT dispositivo_unique UNIQUE (dispositivo);
 G   ALTER TABLE ONLY public.instalacao DROP CONSTRAINT dispositivo_unique;
       public         postgres    false    201                       2606    17905    endereco endereco_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.endereco DROP CONSTRAINT endereco_pk;
       public         postgres    false    199                       2606    17913    instalacao instalacao_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.instalacao
    ADD CONSTRAINT instalacao_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.instalacao DROP CONSTRAINT instalacao_pk;
       public         postgres    false    201                       2606    17923    ocorrencia ocorrencia_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.ocorrencia
    ADD CONSTRAINT ocorrencia_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.ocorrencia DROP CONSTRAINT ocorrencia_pk;
       public         postgres    false    203                        2606    17928    pessoa_fisica pessoa_fisica_pk 
   CONSTRAINT     d   ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT pessoa_fisica_pk PRIMARY KEY (cliente_id);
 H   ALTER TABLE ONLY public.pessoa_fisica DROP CONSTRAINT pessoa_fisica_pk;
       public         postgres    false    204            $           2606    17935 "   pessoa_juridica pessoa_juridica_pk 
   CONSTRAINT     h   ALTER TABLE ONLY public.pessoa_juridica
    ADD CONSTRAINT pessoa_juridica_pk PRIMARY KEY (cliente_id);
 L   ALTER TABLE ONLY public.pessoa_juridica DROP CONSTRAINT pessoa_juridica_pk;
       public         postgres    false    205            &           2606    17945 &   servico_seguranca servico_seguranca_pk 
   CONSTRAINT     d   ALTER TABLE ONLY public.servico_seguranca
    ADD CONSTRAINT servico_seguranca_pk PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.servico_seguranca DROP CONSTRAINT servico_seguranca_pk;
       public         postgres    false    207            (           2606    17953 (   telefone_associado telefone_associado_pk 
   CONSTRAINT     f   ALTER TABLE ONLY public.telefone_associado
    ADD CONSTRAINT telefone_associado_pk PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.telefone_associado DROP CONSTRAINT telefone_associado_pk;
       public         postgres    false    209            )           2606    17954 -   cliente_final cliente_final_servico_seguranca    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente_final
    ADD CONSTRAINT cliente_final_servico_seguranca FOREIGN KEY (servico_seguranca_id) REFERENCES public.servico_seguranca(id);
 W   ALTER TABLE ONLY public.cliente_final DROP CONSTRAINT cliente_final_servico_seguranca;
       public       postgres    false    207    2854    197            *           2606    17959 #   instalacao instalacao_cliente_final    FK CONSTRAINT     �   ALTER TABLE ONLY public.instalacao
    ADD CONSTRAINT instalacao_cliente_final FOREIGN KEY (cliente_final_id) REFERENCES public.cliente_final(id);
 M   ALTER TABLE ONLY public.instalacao DROP CONSTRAINT instalacao_cliente_final;
       public       postgres    false    201    197    2836            +           2606    17964    instalacao instalacao_endereco    FK CONSTRAINT     �   ALTER TABLE ONLY public.instalacao
    ADD CONSTRAINT instalacao_endereco FOREIGN KEY (endereco_id) REFERENCES public.endereco(id);
 H   ALTER TABLE ONLY public.instalacao DROP CONSTRAINT instalacao_endereco;
       public       postgres    false    201    2838    199            ,           2606    17969     ocorrencia ocorrencia_instalacao    FK CONSTRAINT     �   ALTER TABLE ONLY public.ocorrencia
    ADD CONSTRAINT ocorrencia_instalacao FOREIGN KEY (instalacao_id) REFERENCES public.instalacao(id);
 J   ALTER TABLE ONLY public.ocorrencia DROP CONSTRAINT ocorrencia_instalacao;
       public       postgres    false    203    201    2842            -           2606    17974 #   pessoa_fisica pessoa_fisica_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT pessoa_fisica_cliente FOREIGN KEY (cliente_id) REFERENCES public.cliente_final(id);
 M   ALTER TABLE ONLY public.pessoa_fisica DROP CONSTRAINT pessoa_fisica_cliente;
       public       postgres    false    2836    204    197            .           2606    17979 '   pessoa_juridica pessoa_juridica_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.pessoa_juridica
    ADD CONSTRAINT pessoa_juridica_cliente FOREIGN KEY (cliente_id) REFERENCES public.cliente_final(id);
 Q   ALTER TABLE ONLY public.pessoa_juridica DROP CONSTRAINT pessoa_juridica_cliente;
       public       postgres    false    197    2836    205            /           2606    17984 #   telefone_associado telefone_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.telefone_associado
    ADD CONSTRAINT telefone_cliente FOREIGN KEY (cliente_id) REFERENCES public.cliente_final(id);
 M   ALTER TABLE ONLY public.telefone_associado DROP CONSTRAINT telefone_cliente;
       public       postgres    false    209    2836    197            �   K   x�3�tN,NTH�WK����4�L�,�2�t�-(J�H���ޕ����ʙq�&�d��C՚s��&'�x1z\\\ /xu      �   �   x�}�MN�0���sd;�q��B*u�H��L�i18qe;��,�ňS!���y��=0��J��»!�6�&��=(]%k�s���P�!���R33�ӡ��D��H=�1:��s@K�R"�������3�py�fL�S:R���RHk9���cCwԅT����ra~�=����:����E\�����8�Ӏ�.A%��>�����Ϝ��J]]^�����!�7��r�      �   F   x�E��	�@�︋����]:���y�P�!7��P�)�1����͔���q����~��D�>��,���      �   D   x�3�420��50�54P00�#N= ihl
��8�L���uL�,!�L�@�%P�)1ʌ�b����  �]      �   2   x����0�7�g7�a��?G#u�y��mA��d�g��ɱ��� ��8M      �      x�3�4426153���0�b���� 3.       �      x�3�L��MJ�,��442����� <`�      �   %   x�3�41��4715421�4�2�A\߈+F��� |�4     