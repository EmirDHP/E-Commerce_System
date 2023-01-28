USE [DBCARRITO]
GO

/****** Object:  Table [dbo].[PROVINCIA]    Script Date: 1/27/2023 10:40:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PROVINCIA](
	[IdProvincia] [varchar](4) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL,
	[IdDepartamento] [varchar](2) NOT NULL
) ON [PRIMARY]
GO


