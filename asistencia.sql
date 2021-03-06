USE [master]
GO
/****** Object:  Database [CursoMVC]    Script Date: 26/03/2018 04:51:02 p.m. ******/
CREATE DATABASE [CursoMVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CursoMVC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CursoMVC.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CursoMVC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CursoMVC_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CursoMVC] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CursoMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CursoMVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CursoMVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CursoMVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CursoMVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CursoMVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [CursoMVC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CursoMVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CursoMVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CursoMVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CursoMVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CursoMVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CursoMVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CursoMVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CursoMVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CursoMVC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CursoMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CursoMVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CursoMVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CursoMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CursoMVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CursoMVC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CursoMVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CursoMVC] SET RECOVERY FULL 
GO
ALTER DATABASE [CursoMVC] SET  MULTI_USER 
GO
ALTER DATABASE [CursoMVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CursoMVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CursoMVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CursoMVC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CursoMVC] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CursoMVC', N'ON'
GO
USE [CursoMVC]
GO
/****** Object:  Table [dbo].[Adjunto]    Script Date: 26/03/2018 04:51:02 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adjunto](
	[idAdjuno] [int] IDENTITY(1,1) NOT NULL,
	[idAlumno] [int] NULL,
	[Archivo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Adjunto] PRIMARY KEY CLUSTERED 
(
	[idAdjuno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 26/03/2018 04:51:02 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[idAlumno] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[ApellidoPaterno] [nvarchar](50) NULL,
	[ApellidoMaterno] [nvarchar](50) NULL,
	[Sexo] [int] NULL,
	[FechaNacimiento] [date] NULL,
	[CorreoElectronico] [nvarchar](150) NULL,
	[Telefono] [nvarchar](14) NULL,
	[Celular] [nvarchar](14) NULL,
	[Direccion] [nvarchar](200) NULL,
	[EscuelaProcedencia] [nvarchar](150) NULL,
	[FechaInicio] [date] NULL,
	[Answer] [nvarchar](500) NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[idAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AlumnoCurso]    Script Date: 26/03/2018 04:51:02 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlumnoCurso](
	[idAlumnoCurso] [int] IDENTITY(1,1) NOT NULL,
	[idCurso] [int] NULL,
	[idAlumno] [int] NULL,
	[Calificacion] [int] NULL,
 CONSTRAINT [PK_AlumnoCurso] PRIMARY KEY CLUSTERED 
(
	[idAlumnoCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Asistencia]    Script Date: 26/03/2018 04:51:02 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asistencia](
	[idAsistencia] [int] IDENTITY(1,1) NOT NULL,
	[idAlumnoCurso] [int] NULL,
	[Fecha] [date] NULL,
	[Hora] [nvarchar](50) NULL,
	[Estado] [int] NULL,
	[DiasSemanaId] [int] NOT NULL,
 CONSTRAINT [PK_Asistencia] PRIMARY KEY CLUSTERED 
(
	[idAsistencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AsistenciaA]    Script Date: 26/03/2018 04:51:02 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsistenciaA](
	[idAsistencia] [int] NULL,
	[Fecha] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Curso]    Script Date: 26/03/2018 04:51:02 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[idCurso] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[FechaInicio] [date] NULL,
	[FechaTermino] [date] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[idCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiasSemana]    Script Date: 26/03/2018 04:51:02 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiasSemana](
	[DiasSemanaId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Numero] [int] NOT NULL,
 CONSTRAINT [PK_DiasSemana] PRIMARY KEY CLUSTERED 
(
	[DiasSemanaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProgramacionCurso]    Script Date: 26/03/2018 04:51:02 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramacionCurso](
	[idProgramacionCurso] [int] IDENTITY(1,1) NOT NULL,
	[idCurso] [int] NULL,
	[DiasSemanaId] [int] NOT NULL,
	[activo] [bit] NOT NULL,
	[horario] [datetime] NULL,
 CONSTRAINT [PK_ProgramacionCurso] PRIMARY KEY CLUSTERED 
(
	[idProgramacionCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Adjunto]  WITH CHECK ADD  CONSTRAINT [FK_Adjunto_Alumno] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[Alumno] ([idAlumno])
GO
ALTER TABLE [dbo].[Adjunto] CHECK CONSTRAINT [FK_Adjunto_Alumno]
GO
ALTER TABLE [dbo].[AlumnoCurso]  WITH CHECK ADD  CONSTRAINT [FK_AlumnoCurso_Alumno] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[Alumno] ([idAlumno])
GO
ALTER TABLE [dbo].[AlumnoCurso] CHECK CONSTRAINT [FK_AlumnoCurso_Alumno]
GO
ALTER TABLE [dbo].[AlumnoCurso]  WITH CHECK ADD  CONSTRAINT [FK_AlumnoCurso_Curso] FOREIGN KEY([idCurso])
REFERENCES [dbo].[Curso] ([idCurso])
GO
ALTER TABLE [dbo].[AlumnoCurso] CHECK CONSTRAINT [FK_AlumnoCurso_Curso]
GO
ALTER TABLE [dbo].[Asistencia]  WITH CHECK ADD  CONSTRAINT [FK_Asistencia_DiasSemana] FOREIGN KEY([DiasSemanaId])
REFERENCES [dbo].[DiasSemana] ([DiasSemanaId])
GO
ALTER TABLE [dbo].[Asistencia] CHECK CONSTRAINT [FK_Asistencia_DiasSemana]
GO
ALTER TABLE [dbo].[ProgramacionCurso]  WITH CHECK ADD  CONSTRAINT [FK_ProgramacionCurso_Curso] FOREIGN KEY([idCurso])
REFERENCES [dbo].[Curso] ([idCurso])
GO
ALTER TABLE [dbo].[ProgramacionCurso] CHECK CONSTRAINT [FK_ProgramacionCurso_Curso]
GO
ALTER TABLE [dbo].[ProgramacionCurso]  WITH CHECK ADD  CONSTRAINT [FK_ProgramacionCurso_DiasSemana] FOREIGN KEY([DiasSemanaId])
REFERENCES [dbo].[DiasSemana] ([DiasSemanaId])
GO
ALTER TABLE [dbo].[ProgramacionCurso] CHECK CONSTRAINT [FK_ProgramacionCurso_DiasSemana]
GO
USE [master]
GO
ALTER DATABASE [CursoMVC] SET  READ_WRITE 
GO
