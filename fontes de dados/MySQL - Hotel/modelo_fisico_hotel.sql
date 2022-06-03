-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Hotel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Hotel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Hotel` DEFAULT CHARACTER SET utf8 ;
USE `Hotel` ;

-- -----------------------------------------------------
-- Table `Hotel`.`localCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`localCliente` (
  `idLocalCliente` INT NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLocalCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`cliente` (
  `idCliente` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `contacto` INT NOT NULL,
  `profissao` VARCHAR(45) NOT NULL,
  `idLocalCliente` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_cliente_localCliente1_idx` (`idLocalCliente` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_localCliente1`
    FOREIGN KEY (`idLocalCliente`)
    REFERENCES `Hotel`.`localCliente` (`idLocalCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel`.`tipoEstadia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`tipoEstadia` (
  `idTipoEstadia` INT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoEstadia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel`.`reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`reserva` (
  `idReserva` INT NOT NULL,
  `dataReserva` DATETIME NOT NULL,
  `dataCheckIn` DATETIME NOT NULL,
  `dataCheckOut` DATETIME NOT NULL,
  `totalDeNoites` INT NOT NULL,
  `nrAdultos` INT NOT NULL,
  `nrBebes` INT NOT NULL,
  `nrCriancas` INT NOT NULL,
  `valorTotal` DECIMAL(6,2) NOT NULL,
  `idCliente` INT NOT NULL,
  `idTipoEstadia` INT NOT NULL,
  PRIMARY KEY (`idReserva`),
  INDEX `fk_reserva_cliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `fk_reserva_tipoEstadia1_idx` (`idTipoEstadia` ASC) VISIBLE,
  CONSTRAINT `fk_reserva_cliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `Hotel`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_tipoEstadia1`
    FOREIGN KEY (`idTipoEstadia`)
    REFERENCES `Hotel`.`tipoEstadia` (`idTipoEstadia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel`.`servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`servico` (
  `idServico` INT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `preco` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`idServico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel`.`quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`quarto` (
  `idQuarto` INT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `preco` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`idQuarto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel`.`ReservaServico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`ReservaServico` (
  `idReserva` INT NOT NULL,
  `idServico` INT NOT NULL,
  `valor` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`idReserva`, `idServico`),
  INDEX `fk_servico_has_reserva_reserva1_idx` (`idReserva` ASC) VISIBLE,
  INDEX `fk_servico_has_reserva_servico1_idx` (`idServico` ASC) VISIBLE,
  CONSTRAINT `fk_servico_has_reserva_servico1`
    FOREIGN KEY (`idServico`)
    REFERENCES `Hotel`.`servico` (`idServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servico_has_reserva_reserva1`
    FOREIGN KEY (`idReserva`)
    REFERENCES `Hotel`.`reserva` (`idReserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel`.`ReservaQuarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`ReservaQuarto` (
  `idReserva` INT NOT NULL,
  `idQuarto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `valor` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`idReserva`, `idQuarto`),
  INDEX `fk_quarto_has_reserva_reserva1_idx` (`idReserva` ASC) VISIBLE,
  INDEX `fk_quarto_has_reserva_quarto1_idx` (`idQuarto` ASC) VISIBLE,
  CONSTRAINT `fk_quarto_has_reserva_quarto1`
    FOREIGN KEY (`idQuarto`)
    REFERENCES `Hotel`.`quarto` (`idQuarto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_quarto_has_reserva_reserva1`
    FOREIGN KEY (`idReserva`)
    REFERENCES `Hotel`.`reserva` (`idReserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
