
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/05/2020 08:17:38
-- Generated from EDMX file: C:\Users\Hrachya\source\repos\hrtarposhyan\GenerateModelsDBEFApp\GenerateModelsDBEFApp\GenerateModelsDBEFApp\Data\Models.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [School];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Student_University]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_University];
GO
IF OBJECT_ID(N'[dbo].[FK_Teacher_University_Teacher]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Teacher_University] DROP CONSTRAINT [FK_Teacher_University_Teacher];
GO
IF OBJECT_ID(N'[dbo].[FK_Teacher_University_University]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Teacher_University] DROP CONSTRAINT [FK_Teacher_University_University];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Student]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Student];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[Teacher]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Teacher];
GO
IF OBJECT_ID(N'[dbo].[Teacher_University]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Teacher_University];
GO
IF OBJECT_ID(N'[dbo].[University]', 'U') IS NOT NULL
    DROP TABLE [dbo].[University];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Students'
CREATE TABLE [dbo].[Students] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [LastName] nvarchar(50)  NOT NULL,
    [Age] int  NOT NULL,
    [Gender] tinyint  NULL,
    [Email] nvarchar(50)  NULL,
    [Address] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(50)  NULL,
    [UniversityId] int  NOT NULL
);
GO

-- Creating table 'Teachers'
CREATE TABLE [dbo].[Teachers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [LastName] nvarchar(50)  NOT NULL,
    [Age] int  NULL,
    [PhoneNumber] nvarchar(50)  NULL,
    [Address] nvarchar(max)  NULL,
    [Email] nvarchar(50)  NULL
);
GO

-- Creating table 'Teacher_University'
CREATE TABLE [dbo].[Teacher_University] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TeacherId] int  NOT NULL,
    [UniversityId] int  NOT NULL,
    [StartDate] datetime  NULL,
    [EndDate] datetime  NULL,
    [Hour] int  NULL
);
GO

-- Creating table 'Universities'
CREATE TABLE [dbo].[Universities] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [PhoneNumber] nvarchar(50)  NULL,
    [Email] nvarchar(50)  NULL,
    [Address] nvarchar(50)  NULL,
    [DestroyDate] datetime  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [PK_Students]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Teachers'
ALTER TABLE [dbo].[Teachers]
ADD CONSTRAINT [PK_Teachers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Teacher_University'
ALTER TABLE [dbo].[Teacher_University]
ADD CONSTRAINT [PK_Teacher_University]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Universities'
ALTER TABLE [dbo].[Universities]
ADD CONSTRAINT [PK_Universities]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UniversityId] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [FK_Student_University]
    FOREIGN KEY ([UniversityId])
    REFERENCES [dbo].[Universities]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Student_University'
CREATE INDEX [IX_FK_Student_University]
ON [dbo].[Students]
    ([UniversityId]);
GO

-- Creating foreign key on [TeacherId] in table 'Teacher_University'
ALTER TABLE [dbo].[Teacher_University]
ADD CONSTRAINT [FK_Teacher_University_Teacher]
    FOREIGN KEY ([TeacherId])
    REFERENCES [dbo].[Teachers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Teacher_University_Teacher'
CREATE INDEX [IX_FK_Teacher_University_Teacher]
ON [dbo].[Teacher_University]
    ([TeacherId]);
GO

-- Creating foreign key on [UniversityId] in table 'Teacher_University'
ALTER TABLE [dbo].[Teacher_University]
ADD CONSTRAINT [FK_Teacher_University_University]
    FOREIGN KEY ([UniversityId])
    REFERENCES [dbo].[Universities]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Teacher_University_University'
CREATE INDEX [IX_FK_Teacher_University_University]
ON [dbo].[Teacher_University]
    ([UniversityId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------