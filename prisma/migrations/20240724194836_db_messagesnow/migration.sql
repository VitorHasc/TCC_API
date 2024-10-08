-- CreateTable
CREATE TABLE `Usuario` (
    `idusuario` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `cidade` VARCHAR(191) NULL,
    `latitude` DOUBLE NULL,
    `longitude` DOUBLE NULL,
    `perfilFoto` VARCHAR(191) NULL,
    `biografia` VARCHAR(500) NULL,
    `senha` VARCHAR(191) NOT NULL,
    `datanasc` DATETIME(3) NOT NULL,
    `genero` ENUM('fem', 'masc', 'outro') NOT NULL DEFAULT 'outro',
    `online` DATETIME(3) NOT NULL,
    `nick` VARCHAR(191) NULL,

    UNIQUE INDEX `Usuario_idusuario_key`(`idusuario`),
    UNIQUE INDEX `Usuario_nome_key`(`nome`),
    UNIQUE INDEX `Usuario_email_key`(`email`),
    PRIMARY KEY (`idusuario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Esporte` (
    `idesporte` INTEGER NOT NULL AUTO_INCREMENT,
    `usuarioId` INTEGER NOT NULL,
    `nome` VARCHAR(500) NOT NULL,

    PRIMARY KEY (`idesporte`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MensagemInd` (
    `idmensagem` INTEGER NOT NULL AUTO_INCREMENT,
    `remetenteId` INTEGER NOT NULL,
    `destinatarioId` INTEGER NOT NULL,
    `texto` VARCHAR(1000) NOT NULL,
    `horario` DATETIME(3) NOT NULL,

    UNIQUE INDEX `MensagemInd_idmensagem_key`(`idmensagem`),
    PRIMARY KEY (`idmensagem`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Esporte` ADD CONSTRAINT `Esporte_usuarioId_fkey` FOREIGN KEY (`usuarioId`) REFERENCES `Usuario`(`idusuario`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MensagemInd` ADD CONSTRAINT `MensagemInd_remetenteId_fkey` FOREIGN KEY (`remetenteId`) REFERENCES `Usuario`(`idusuario`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MensagemInd` ADD CONSTRAINT `MensagemInd_destinatarioId_fkey` FOREIGN KEY (`destinatarioId`) REFERENCES `Usuario`(`idusuario`) ON DELETE RESTRICT ON UPDATE CASCADE;
