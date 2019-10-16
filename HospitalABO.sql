--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-10-10 22:11:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 210 (class 1259 OID 24671)
-- Name: AvanceMedico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AvanceMedico" (
    "idAvance" integer NOT NULL,
    paciente integer,
    medico integer,
    descripcion text
);


ALTER TABLE public."AvanceMedico" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24679)
-- Name: CitaMedica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CitaMedica" (
    "idCita" integer NOT NULL,
    paciente integer,
    medico integer,
    fecha date,
    descripcion text
);


ALTER TABLE public."CitaMedica" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 24645)
-- Name: Cuidador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cuidador" (
    cedula integer NOT NULL,
    nombre "char",
    apellido "char",
    edad integer,
    direccion text,
    telefono integer,
    "horarioInicio" abstime,
    "horarioFin" abstime
);


ALTER TABLE public."Cuidador" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 24661)
-- Name: Especialidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Especialidad" (
    "idEspecialidad" integer NOT NULL,
    nombre "char"
);


ALTER TABLE public."Especialidad" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 24653)
-- Name: ExamenMedico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ExamenMedico" (
    "idExamen" integer NOT NULL,
    paciente integer,
    medico integer,
    documento bytea,
    descripcion text
);


ALTER TABLE public."ExamenMedico" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 24614)
-- Name: Expediente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Expediente" (
    "idExpediente" integer NOT NULL,
    conexion "char"[]
);


ALTER TABLE public."Expediente" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24622)
-- Name: Familiar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Familiar" (
    cedula integer NOT NULL,
    nombre "char",
    apellido "char",
    telefono integer,
    correo "char",
    direccion text,
    "tipoRelacion" integer,
    paciente integer
);


ALTER TABLE public."Familiar" OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 24593)
-- Name: HistorialJuego; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HistorialJuego" (
    "idHistorial" integer NOT NULL,
    avance text,
    puntaje integer,
    tiempo abstime,
    nivel integer,
    paciente integer,
    juego integer
);


ALTER TABLE public."HistorialJuego" OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 24601)
-- Name: HistorialPersonal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HistorialPersonal" (
    "idHistorico" integer NOT NULL,
    paciente integer,
    fecha date,
    descripcion text
);


ALTER TABLE public."HistorialPersonal" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 24585)
-- Name: Juego; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Juego" (
    "idJuego" integer NOT NULL,
    nombre "char",
    descripcion text
);


ALTER TABLE public."Juego" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 24640)
-- Name: Medicamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Medicamento" (
    "idMedicamento" integer NOT NULL,
    nombre "char",
    dosis "char",
    "fechaInicio" date,
    "fechaFin" date,
    horario abstime,
    paciente integer,
    "tipoMedicamento" integer
);


ALTER TABLE public."Medicamento" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24687)
-- Name: Notificacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Notificacion" (
    "idNotificacion" integer NOT NULL,
    paciente integer,
    familiar integer NOT NULL,
    medico integer NOT NULL,
    descripcion text
);


ALTER TABLE public."Notificacion" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 24577)
-- Name: Paciente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Paciente" (
    cedula integer NOT NULL,
    nombre "char",
    apellido "char",
    "lugarResidencia" text,
    expediente integer,
    "gradoAcademico" text,
    "fechaNacimiento" date,
    juego integer,
    ubicacion integer
);


ALTER TABLE public."Paciente" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 24609)
-- Name: Relacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Relacion" (
    "idRelacion" integer NOT NULL,
    tipo "char"
);


ALTER TABLE public."Relacion" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24666)
-- Name: Terapeuta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Terapeuta" (
    cedula integer NOT NULL,
    codigo integer,
    nombre "char",
    apellido "char",
    especialidad integer,
    "horarioInicio" abstime,
    "horarioFin" abstime
);


ALTER TABLE public."Terapeuta" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24635)
-- Name: TipoMedicamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TipoMedicamento" (
    "idTipo" integer NOT NULL,
    nombre "char"
);


ALTER TABLE public."TipoMedicamento" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 24630)
-- Name: Ubicacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ubicacion" (
    "idUbicacion" integer NOT NULL,
    "coordenadaX" "char",
    "coordenadaY" "char",
    hora reltime,
    fecha date
);


ALTER TABLE public."Ubicacion" OWNER TO postgres;

--
-- TOC entry 2946 (class 0 OID 24671)
-- Dependencies: 210
-- Data for Name: AvanceMedico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AvanceMedico" ("idAvance", paciente, medico, descripcion) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 24679)
-- Dependencies: 211
-- Data for Name: CitaMedica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CitaMedica" ("idCita", paciente, medico, fecha, descripcion) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 24645)
-- Dependencies: 206
-- Data for Name: Cuidador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cuidador" (cedula, nombre, apellido, edad, direccion, telefono, "horarioInicio", "horarioFin") FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 24661)
-- Dependencies: 208
-- Data for Name: Especialidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Especialidad" ("idEspecialidad", nombre) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 24653)
-- Dependencies: 207
-- Data for Name: ExamenMedico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ExamenMedico" ("idExamen", paciente, medico, documento, descripcion) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 24614)
-- Dependencies: 201
-- Data for Name: Expediente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Expediente" ("idExpediente", conexion) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 24622)
-- Dependencies: 202
-- Data for Name: Familiar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Familiar" (cedula, nombre, apellido, telefono, correo, direccion, "tipoRelacion", paciente) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 24593)
-- Dependencies: 198
-- Data for Name: HistorialJuego; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."HistorialJuego" ("idHistorial", avance, puntaje, tiempo, nivel, paciente, juego) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 24601)
-- Dependencies: 199
-- Data for Name: HistorialPersonal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."HistorialPersonal" ("idHistorico", paciente, fecha, descripcion) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 24585)
-- Dependencies: 197
-- Data for Name: Juego; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Juego" ("idJuego", nombre, descripcion) FROM stdin;
\.


--
-- TOC entry 2941 (class 0 OID 24640)
-- Dependencies: 205
-- Data for Name: Medicamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Medicamento" ("idMedicamento", nombre, dosis, "fechaInicio", "fechaFin", horario, paciente, "tipoMedicamento") FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 24687)
-- Dependencies: 212
-- Data for Name: Notificacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Notificacion" ("idNotificacion", paciente, familiar, medico, descripcion) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 24577)
-- Dependencies: 196
-- Data for Name: Paciente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Paciente" (cedula, nombre, apellido, "lugarResidencia", expediente, "gradoAcademico", "fechaNacimiento", juego, ubicacion) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 24609)
-- Dependencies: 200
-- Data for Name: Relacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Relacion" ("idRelacion", tipo) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 24666)
-- Dependencies: 209
-- Data for Name: Terapeuta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Terapeuta" (cedula, codigo, nombre, apellido, especialidad, "horarioInicio", "horarioFin") FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 24635)
-- Dependencies: 204
-- Data for Name: TipoMedicamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TipoMedicamento" ("idTipo", nombre) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 24630)
-- Dependencies: 203
-- Data for Name: Ubicacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ubicacion" ("idUbicacion", "coordenadaX", "coordenadaY", hora, fecha) FROM stdin;
\.


--
-- TOC entry 2787 (class 2606 OID 24678)
-- Name: AvanceMedico AvanceMedico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AvanceMedico"
    ADD CONSTRAINT "AvanceMedico_pkey" PRIMARY KEY ("idAvance");


--
-- TOC entry 2789 (class 2606 OID 24686)
-- Name: CitaMedica CitaMedica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CitaMedica"
    ADD CONSTRAINT "CitaMedica_pkey" PRIMARY KEY ("idCita");


--
-- TOC entry 2779 (class 2606 OID 24652)
-- Name: Cuidador Cuidador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cuidador"
    ADD CONSTRAINT "Cuidador_pkey" PRIMARY KEY (cedula);


--
-- TOC entry 2783 (class 2606 OID 24665)
-- Name: Especialidad Especialidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Especialidad"
    ADD CONSTRAINT "Especialidad_pkey" PRIMARY KEY ("idEspecialidad");


--
-- TOC entry 2781 (class 2606 OID 24660)
-- Name: ExamenMedico ExamenMedico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ExamenMedico"
    ADD CONSTRAINT "ExamenMedico_pkey" PRIMARY KEY ("idExamen");


--
-- TOC entry 2769 (class 2606 OID 24621)
-- Name: Expediente Expediente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Expediente"
    ADD CONSTRAINT "Expediente_pkey" PRIMARY KEY ("idExpediente");


--
-- TOC entry 2771 (class 2606 OID 24629)
-- Name: Familiar Familiar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Familiar"
    ADD CONSTRAINT "Familiar_pkey" PRIMARY KEY (cedula);


--
-- TOC entry 2765 (class 2606 OID 24608)
-- Name: HistorialPersonal HistorialPersonal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistorialPersonal"
    ADD CONSTRAINT "HistorialPersonal_pkey" PRIMARY KEY ("idHistorico");


--
-- TOC entry 2761 (class 2606 OID 24592)
-- Name: Juego Juego_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Juego"
    ADD CONSTRAINT "Juego_pkey" PRIMARY KEY ("idJuego");


--
-- TOC entry 2777 (class 2606 OID 24644)
-- Name: Medicamento Medicamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Medicamento"
    ADD CONSTRAINT "Medicamento_pkey" PRIMARY KEY ("idMedicamento");


--
-- TOC entry 2791 (class 2606 OID 24694)
-- Name: Notificacion Notificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notificacion"
    ADD CONSTRAINT "Notificacion_pkey" PRIMARY KEY ("idNotificacion");


--
-- TOC entry 2759 (class 2606 OID 24584)
-- Name: Paciente Paciente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paciente"
    ADD CONSTRAINT "Paciente_pkey" PRIMARY KEY (cedula);


--
-- TOC entry 2767 (class 2606 OID 24613)
-- Name: Relacion Relacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Relacion"
    ADD CONSTRAINT "Relacion_pkey" PRIMARY KEY ("idRelacion");


--
-- TOC entry 2785 (class 2606 OID 24670)
-- Name: Terapeuta Terapeuta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Terapeuta"
    ADD CONSTRAINT "Terapeuta_pkey" PRIMARY KEY (cedula);


--
-- TOC entry 2775 (class 2606 OID 24639)
-- Name: TipoMedicamento TipoMedicamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TipoMedicamento"
    ADD CONSTRAINT "TipoMedicamento_pkey" PRIMARY KEY ("idTipo");


--
-- TOC entry 2773 (class 2606 OID 24634)
-- Name: Ubicacion Ubicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ubicacion"
    ADD CONSTRAINT "Ubicacion_pkey" PRIMARY KEY ("idUbicacion");


--
-- TOC entry 2763 (class 2606 OID 24600)
-- Name: HistorialJuego historialJuego_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistorialJuego"
    ADD CONSTRAINT "historialJuego_pkey" PRIMARY KEY ("idHistorial");


--
-- TOC entry 2803 (class 2606 OID 24781)
-- Name: Terapeuta FK_especialidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Terapeuta"
    ADD CONSTRAINT "FK_especialidad" FOREIGN KEY (especialidad) REFERENCES public."Especialidad"("idEspecialidad");


--
-- TOC entry 2792 (class 2606 OID 24776)
-- Name: Paciente FK_expediente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paciente"
    ADD CONSTRAINT "FK_expediente" FOREIGN KEY (expediente) REFERENCES public."Expediente"("idExpediente");


--
-- TOC entry 2810 (class 2606 OID 24771)
-- Name: Notificacion FK_familiar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notificacion"
    ADD CONSTRAINT "FK_familiar" FOREIGN KEY (familiar) REFERENCES public."Familiar"(cedula);


--
-- TOC entry 2795 (class 2606 OID 24741)
-- Name: HistorialJuego FK_juego; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistorialJuego"
    ADD CONSTRAINT "FK_juego" FOREIGN KEY (juego) REFERENCES public."Juego"("idJuego");


--
-- TOC entry 2805 (class 2606 OID 24701)
-- Name: AvanceMedico FK_medico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AvanceMedico"
    ADD CONSTRAINT "FK_medico" FOREIGN KEY (medico) REFERENCES public."Terapeuta"(cedula);


--
-- TOC entry 2806 (class 2606 OID 24706)
-- Name: CitaMedica FK_medico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CitaMedica"
    ADD CONSTRAINT "FK_medico" FOREIGN KEY (medico) REFERENCES public."Terapeuta"(cedula);


--
-- TOC entry 2802 (class 2606 OID 24721)
-- Name: ExamenMedico FK_medico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ExamenMedico"
    ADD CONSTRAINT "FK_medico" FOREIGN KEY (medico) REFERENCES public."Terapeuta"(cedula);


--
-- TOC entry 2809 (class 2606 OID 24766)
-- Name: Notificacion FK_medico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notificacion"
    ADD CONSTRAINT "FK_medico" FOREIGN KEY (medico) REFERENCES public."Terapeuta"(cedula);


--
-- TOC entry 2804 (class 2606 OID 24696)
-- Name: AvanceMedico FK_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AvanceMedico"
    ADD CONSTRAINT "FK_paciente" FOREIGN KEY (paciente) REFERENCES public."Paciente"(cedula);


--
-- TOC entry 2807 (class 2606 OID 24711)
-- Name: CitaMedica FK_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CitaMedica"
    ADD CONSTRAINT "FK_paciente" FOREIGN KEY (paciente) REFERENCES public."Paciente"(cedula);


--
-- TOC entry 2801 (class 2606 OID 24716)
-- Name: ExamenMedico FK_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ExamenMedico"
    ADD CONSTRAINT "FK_paciente" FOREIGN KEY (paciente) REFERENCES public."Paciente"(cedula);


--
-- TOC entry 2798 (class 2606 OID 24731)
-- Name: Familiar FK_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Familiar"
    ADD CONSTRAINT "FK_paciente" FOREIGN KEY (paciente) REFERENCES public."Paciente"(cedula);


--
-- TOC entry 2794 (class 2606 OID 24736)
-- Name: HistorialJuego FK_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistorialJuego"
    ADD CONSTRAINT "FK_paciente" FOREIGN KEY (paciente) REFERENCES public."Paciente"(cedula);


--
-- TOC entry 2796 (class 2606 OID 24746)
-- Name: HistorialPersonal FK_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistorialPersonal"
    ADD CONSTRAINT "FK_paciente" FOREIGN KEY (paciente) REFERENCES public."Paciente"(cedula);


--
-- TOC entry 2799 (class 2606 OID 24751)
-- Name: Medicamento FK_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Medicamento"
    ADD CONSTRAINT "FK_paciente" FOREIGN KEY (paciente) REFERENCES public."Paciente"(cedula);


--
-- TOC entry 2808 (class 2606 OID 24761)
-- Name: Notificacion FK_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notificacion"
    ADD CONSTRAINT "FK_paciente" FOREIGN KEY (paciente) REFERENCES public."Paciente"(cedula);


--
-- TOC entry 2800 (class 2606 OID 24756)
-- Name: Medicamento FK_tipoMedicamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Medicamento"
    ADD CONSTRAINT "FK_tipoMedicamento" FOREIGN KEY ("tipoMedicamento") REFERENCES public."TipoMedicamento"("idTipo");


--
-- TOC entry 2797 (class 2606 OID 24726)
-- Name: Familiar FK_tipoRelacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Familiar"
    ADD CONSTRAINT "FK_tipoRelacion" FOREIGN KEY ("tipoRelacion") REFERENCES public."Relacion"("idRelacion");


--
-- TOC entry 2793 (class 2606 OID 24786)
-- Name: Paciente FK_ubicacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paciente"
    ADD CONSTRAINT "FK_ubicacion" FOREIGN KEY (ubicacion) REFERENCES public."Ubicacion"("idUbicacion");


-- Completed on 2019-10-10 22:11:21

--
-- PostgreSQL database dump complete
--

