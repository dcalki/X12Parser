﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:import href="Ansi-Common.xslt"/>
  <xsl:output method="xml" indent="yes"/>

  <xsl:template name="Product">
    <xsl:param name="QualifierCode"/>
    <xsl:param name="ProductId"/>
    <xsl:if test="string-length($ProductId) > 0">
      <Product>
        <xsl:call-template name="Identification">
          <xsl:with-param name="Qualifier" select="$QualifierCode"/>
          <xsl:with-param name="Number" select="$ProductId"/>
        </xsl:call-template>
      </Product>
    </xsl:if>
  </xsl:template>

  <xsl:template match="SN1">
    <Detail>
      <xsl:if test="string-length(SN101)>0">
        <xsl:attribute name="AssignedId">
          <xsl:value-of select="SN101"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="string-length(SN108)>0">
        <xsl:attribute name="StatusCode">
          <xsl:value-of select="SN108"/>
        </xsl:attribute>
      </xsl:if>
      <Quantity>
        <xsl:attribute name="Shipped">
          <xsl:value-of select="SN102"/>
        </xsl:attribute>
        <xsl:if test="string-length(SN104) > 0">
          <xsl:attribute name="ShippedToDate">
            <xsl:value-of select="SN104"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="string-length(SN105) > 0">
          <xsl:attribute name="Ordered">
            <xsl:value-of select="SN105"/>
          </xsl:attribute>
        </xsl:if>
      </Quantity>
      <UnitOfMeasure>
        <xsl:attribute name="Code">
          <xsl:value-of select="SN103"/>
        </xsl:attribute>
        <xsl:if test="string-length(SN106) >0">
          <xsl:value-of select="SN106"/>
        </xsl:if>
      </UnitOfMeasure>
    </Detail>
  </xsl:template>

  <xsl:template match="PRF">
    <PurchaseOrderReference>
      <xsl:if test="string-length(PRF04) > 0">
        <xsl:attribute name="Date">
          <xsl:call-template name="FormatD8Date">
            <xsl:with-param name="Date" select="PRF04"/>
          </xsl:call-template>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="string-length(PRF05) > 0">
        <xsl:attribute name="AssignedId">
          <xsl:value-of select="PRF05"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:call-template name="Identification">
        <xsl:with-param name="Qualifier" select="PRF02"/>
        <xsl:with-param name="Number" select="PRF01"/>
      </xsl:call-template>
    </PurchaseOrderReference>
  </xsl:template>

  <xsl:template match="CLD">
    <LoadDetail>
      <xsl:attribute name="NumberOfLoads">
        <xsl:value-of select="CLD01"/>
      </xsl:attribute>
      <xsl:attribute name="UnitsShipped">
        <xsl:value-of select="CLD02"/>
      </xsl:attribute>
      <xsl:call-template name="Identification">
        <xsl:with-param name="Qualifier" select="CLD03"/>
      </xsl:call-template>
    </LoadDetail>
  </xsl:template>
  
  <!-- Item Loop -->
  <xsl:template match="HierarchicalLoop[@LoopId='ITEM']">
    <Item>
      <xsl:attribute name="Number">
        <xsl:value-of select="LIN/LIN01"/>
      </xsl:attribute>
      <xsl:call-template name="Product">
        <xsl:with-param name="QualifierCode" select="LIN/LIN02"/>
        <xsl:with-param name="ProductId" select="LIN/LIN03"/>
      </xsl:call-template>
      <xsl:call-template name="Product">
        <xsl:with-param name="QualifierCode" select="LIN/LIN04"/>
        <xsl:with-param name="ProductId" select="LIN/LIN05"/>
      </xsl:call-template>
      <xsl:call-template name="Product">
        <xsl:with-param name="QualifierCode" select="LIN/LIN06"/>
        <xsl:with-param name="ProductId" select="LIN/LIN07"/>
      </xsl:call-template>
      <xsl:call-template name="Product">
        <xsl:with-param name="QualifierCode" select="LIN/LIN08"/>
        <xsl:with-param name="ProductId" select="LIN/LIN09"/>
      </xsl:call-template>
      <xsl:call-template name="Product">
        <xsl:with-param name="QualifierCode" select="LIN/LIN10"/>
        <xsl:with-param name="ProductId" select="LIN/LIN11"/>
      </xsl:call-template>
      <xsl:call-template name="Product">
        <xsl:with-param name="QualifierCode" select="LIN/LIN12"/>
        <xsl:with-param name="ProductId" select="LIN/LIN13"/>
      </xsl:call-template>
      <xsl:call-template name="Product">
        <xsl:with-param name="QualifierCode" select="LIN/LIN14"/>
        <xsl:with-param name="ProductId" select="LIN/LIN15"/>
      </xsl:call-template>
      <xsl:call-template name="Product">
        <xsl:with-param name="QualifierCode" select="LIN/LIN16"/>
        <xsl:with-param name="ProductId" select="LIN/LIN17"/>
      </xsl:call-template>
      <xsl:call-template name="Product">
        <xsl:with-param name="QualifierCode" select="LIN/LIN18"/>
        <xsl:with-param name="ProductId" select="LIN/LIN19"/>
      </xsl:call-template>
      <xsl:call-template name="Product">
        <xsl:with-param name="QualifierCode" select="LIN/LIN20"/>
        <xsl:with-param name="ProductId" select="LIN/LIN21"/>
      </xsl:call-template>
      <xsl:call-template name="Product">
        <xsl:with-param name="QualifierCode" select="LIN/LIN22"/>
        <xsl:with-param name="ProductId" select="LIN/LIN23"/>
      </xsl:call-template>
      <xsl:call-template name="Product">
        <xsl:with-param name="QualifierCode" select="LIN/LIN24"/>
        <xsl:with-param name="ProductId" select="LIN/LIN25"/>
      </xsl:call-template>
      <xsl:call-template name="Product">
        <xsl:with-param name="QualifierCode" select="LIN/LIN26"/>
        <xsl:with-param name="ProductId" select="LIN/LIN27"/>
      </xsl:call-template>
      <xsl:call-template name="Product">
        <xsl:with-param name="QualifierCode" select="LIN/LIN28"/>
        <xsl:with-param name="ProductId" select="LIN/LIN29"/>
      </xsl:call-template>
      <xsl:call-template name="Product">
        <xsl:with-param name="QualifierCode" select="LIN/LIN30"/>
        <xsl:with-param name="ProductId" select="LIN/LIN31"/>
      </xsl:call-template>
      <xsl:apply-templates select="PRF"/>
      <xsl:apply-templates select="SN1"/>
      <xsl:apply-templates select="Loop/CLD"/>
    </Item>
  </xsl:template>
  
  <!-- Order Loop -->
  <xsl:template match="HierarchicalLoop[@LoopId='ORDER']">
    <Order>
      <xsl:apply-templates select="PRF"/>
      <xsl:apply-templates select="HierarchicalLoop"/>                           
    </Order>
  </xsl:template>
  <!-- Shipment Loop -->
  <xsl:template match="HierarchicalLoop[@LoopId='SHIPMENT']">
    <Shipment>
      <xsl:apply-templates select="REF"/>
      <xsl:for-each select="Loop[@LoopId='SUPPLIER']">
        <Supplier>
          <xsl:apply-templates select="N1"/>
          <xsl:apply-templates select="N3"/>
        </Supplier>
      </xsl:for-each>
      <xsl:for-each select="Loop[@LoopId='SHIPFROM']">
        <ShipFrom>
        <xsl:apply-templates select="N1"/>
          <xsl:apply-templates select="N3"/>
        </ShipFrom>
      </xsl:for-each>
      <xsl:for-each select="Loop[@LoopId='SHIPTO']">
        <ShipTo>
          <xsl:apply-templates select="N1"/>
          <xsl:apply-templates select="N3"/>
        </ShipTo>
      </xsl:for-each>      
      <xsl:apply-templates select="HierarchicalLoop"/>
    </Shipment>
  </xsl:template>  
  <!-- Transaction Loop -->
  <xsl:template match="Transaction">
    <Transaction>
      <xsl:attribute name="ControlNumber">
        <xsl:value-of select="ST/ST02"/>
      </xsl:attribute>
      <xsl:attribute name="ProductionDate">
        <xsl:call-template name="FormatD8Date">
          <xsl:with-param name="Date" select="DTM[DTM01='405']/DTM02"/>
        </xsl:call-template>
      </xsl:attribute>
      <xsl:apply-templates select="../../ISA"/>
      <xsl:apply-templates select="../GS"/>
      <xsl:apply-templates select="HierarchicalLoop"/>
    </Transaction>
  </xsl:template>
  
  <xsl:template match="/">
    <ArrayOfTransaction>
      <xsl:apply-templates select="/Interchange/FunctionGroup/Transaction"/>
    </ArrayOfTransaction>
  </xsl:template>
</xsl:stylesheet>