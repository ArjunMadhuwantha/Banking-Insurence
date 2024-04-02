using System;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Bank_Insurance.Migrations
{
    /// <inheritdoc />
    public partial class initialAll : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "DivisaranaDatas",
                columns: table => new
                {
                    CustomerPolicyNo = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Fullname = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Address = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ID = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    BankMemberNo = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    DOB = table.Column<DateOnly>(type: "date", nullable: false),
                    Job = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Succssor = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DivisaranaDatas", x => x.CustomerPolicyNo);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "InsuranceProducts",
                columns: table => new
                {
                    InsuranceProductID = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    InsuranceProductName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_InsuranceProducts", x => x.InsuranceProductID);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "LoanCustomers",
                columns: table => new
                {
                    CustomerPolicyNo = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    CustomerName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ID = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Address = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ProjectName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    LoanIssueDate = table.Column<DateOnly>(type: "date", nullable: false),
                    LoanEndDate = table.Column<DateOnly>(type: "date", nullable: false),
                    TeamNo = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    LoanValue = table.Column<double>(type: "double", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_LoanCustomers", x => x.CustomerPolicyNo);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Zones",
                columns: table => new
                {
                    ZoneId = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Zone_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Status = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Zones", x => x.ZoneId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "DivisaranaCircleDates",
                columns: table => new
                {
                    CircleId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    BranchId = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Fullname = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    TimePeriod = table.Column<int>(type: "int", nullable: false),
                    AddmissionFee = table.Column<double>(type: "double", nullable: false),
                    TotalAmount = table.Column<double>(type: "double", nullable: false),
                    DueAmount = table.Column<double>(type: "double", nullable: true),
                    StartDate = table.Column<DateOnly>(type: "date", nullable: false),
                    NextExecuteDate = table.Column<DateOnly>(type: "date", nullable: false),
                    RecoveryAmount = table.Column<double>(type: "double", nullable: false),
                    CustomerPolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DivisaranaCircleDates", x => x.CircleId);
                    table.ForeignKey(
                        name: "FK_DivisaranaCircleDates_DivisaranaDatas_CustomerPolicyNo",
                        column: x => x.CustomerPolicyNo,
                        principalTable: "DivisaranaDatas",
                        principalColumn: "CustomerPolicyNo");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "DivisaranaCompensations",
                columns: table => new
                {
                    CompensationId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    MemberName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    BranchId = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    DivisaranaNo = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    DeathPersonName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    HospitalizedPerson = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    DeathDate = table.Column<DateOnly>(type: "date", nullable: false),
                    DischargeDate = table.Column<DateOnly>(type: "date", nullable: false),
                    Realtion = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Hospital = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Diseases = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Surgery = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    CompensationValue = table.Column<double>(type: "double", nullable: true),
                    Reason = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    CustomerPolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DivisaranaCompensations", x => x.CompensationId);
                    table.ForeignKey(
                        name: "FK_DivisaranaCompensations_DivisaranaDatas_CustomerPolicyNo",
                        column: x => x.CustomerPolicyNo,
                        principalTable: "DivisaranaDatas",
                        principalColumn: "CustomerPolicyNo");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "DivisaranaPayments",
                columns: table => new
                {
                    PaymentId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    BranchId = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Fullname = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    PaymentDate = table.Column<DateOnly>(type: "date", nullable: false),
                    SystemDate = table.Column<DateOnly>(type: "date", nullable: false),
                    PaymentValue = table.Column<double>(type: "double", nullable: true),
                    RunningBalance = table.Column<double>(type: "double", nullable: true),
                    CustomerPolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DivisaranaPayments", x => x.PaymentId);
                    table.ForeignKey(
                        name: "FK_DivisaranaPayments_DivisaranaDatas_CustomerPolicyNo",
                        column: x => x.CustomerPolicyNo,
                        principalTable: "DivisaranaDatas",
                        principalColumn: "CustomerPolicyNo");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "DivisaranaSuccssors",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    SuccsorName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    SuccssorDob = table.Column<DateOnly>(type: "date", nullable: false),
                    Age = table.Column<int>(type: "int", nullable: false),
                    Relationship = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    CustomerPolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DivisaranaSuccssors", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DivisaranaSuccssors_DivisaranaDatas_CustomerPolicyNo",
                        column: x => x.CustomerPolicyNo,
                        principalTable: "DivisaranaDatas",
                        principalColumn: "CustomerPolicyNo");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "LoanCompenstaions",
                columns: table => new
                {
                    LoanCompenstaionID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    FullName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    BranchId = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Value = table.Column<double>(type: "double", nullable: false),
                    CompenstaionValue = table.Column<double>(type: "double", nullable: false),
                    Requirement = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Comment = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Date = table.Column<DateOnly>(type: "date", nullable: false),
                    CustomerPolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_LoanCompenstaions", x => x.LoanCompenstaionID);
                    table.ForeignKey(
                        name: "FK_LoanCompenstaions_LoanCustomers_CustomerPolicyNo",
                        column: x => x.CustomerPolicyNo,
                        principalTable: "LoanCustomers",
                        principalColumn: "CustomerPolicyNo");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "LoanPayments",
                columns: table => new
                {
                    PaymentId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    PaymentDate = table.Column<DateOnly>(type: "date", nullable: false),
                    Paymentvalue = table.Column<double>(type: "double", nullable: false),
                    CustomerPolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_LoanPayments", x => x.PaymentId);
                    table.ForeignKey(
                        name: "FK_LoanPayments_LoanCustomers_CustomerPolicyNo",
                        column: x => x.CustomerPolicyNo,
                        principalTable: "LoanCustomers",
                        principalColumn: "CustomerPolicyNo");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Branches",
                columns: table => new
                {
                    BranchId = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Branch_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Address = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    TpNo = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    City = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ZoneId = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Branches", x => x.BranchId);
                    table.ForeignKey(
                        name: "FK_Branches_Zones_ZoneId",
                        column: x => x.ZoneId,
                        principalTable: "Zones",
                        principalColumn: "ZoneId");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "DivisaranaAbhiperanas",
                columns: table => new
                {
                    DataId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Month = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Amount = table.Column<double>(type: "double", nullable: true),
                    Comment = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    BranchId = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DivisaranaAbhiperanas", x => x.DataId);
                    table.ForeignKey(
                        name: "FK_DivisaranaAbhiperanas_Branches_BranchId",
                        column: x => x.BranchId,
                        principalTable: "Branches",
                        principalColumn: "BranchId");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "DivisaranaParithoshithas",
                columns: table => new
                {
                    DataId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    MemberNo = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Amount = table.Column<double>(type: "double", nullable: true),
                    Comment = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    BranchId = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DivisaranaParithoshithas", x => x.DataId);
                    table.ForeignKey(
                        name: "FK_DivisaranaParithoshithas_Branches_BranchId",
                        column: x => x.BranchId,
                        principalTable: "Branches",
                        principalColumn: "BranchId");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Insuarances",
                columns: table => new
                {
                    InsuranceId = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    StartDate = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    PolicyNo = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    InsuranceProductID = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    BranchId = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Insuarances", x => x.InsuranceId);
                    table.ForeignKey(
                        name: "FK_Insuarances_Branches_BranchId",
                        column: x => x.BranchId,
                        principalTable: "Branches",
                        principalColumn: "BranchId");
                    table.ForeignKey(
                        name: "FK_Insuarances_InsuranceProducts_InsuranceProductID",
                        column: x => x.InsuranceProductID,
                        principalTable: "InsuranceProducts",
                        principalColumn: "InsuranceProductID");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "SavingReliefParithoshithas",
                columns: table => new
                {
                    DataId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    MemberNo = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Amount = table.Column<double>(type: "double", nullable: true),
                    Comment = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    BranchId = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SavingReliefParithoshithas", x => x.DataId);
                    table.ForeignKey(
                        name: "FK_SavingReliefParithoshithas_Branches_BranchId",
                        column: x => x.BranchId,
                        principalTable: "Branches",
                        principalColumn: "BranchId");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "BankingInsuarances",
                columns: table => new
                {
                    PolicyNo = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    InsuranceId = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BankingInsuarances", x => x.PolicyNo);
                    table.ForeignKey(
                        name: "FK_BankingInsuarances_Insuarances_InsuranceId",
                        column: x => x.InsuranceId,
                        principalTable: "Insuarances",
                        principalColumn: "InsuranceId");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "BuildingInsuarances",
                columns: table => new
                {
                    PolicyNo = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    InsuranceId = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BuildingInsuarances", x => x.PolicyNo);
                    table.ForeignKey(
                        name: "FK_BuildingInsuarances_Insuarances_InsuranceId",
                        column: x => x.InsuranceId,
                        principalTable: "Insuarances",
                        principalColumn: "InsuranceId");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "DivisaranaTbls",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    PolicyNo = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    InsuranceId = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    CustomerPolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DivisaranaTbls", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DivisaranaTbls_DivisaranaDatas_CustomerPolicyNo",
                        column: x => x.CustomerPolicyNo,
                        principalTable: "DivisaranaDatas",
                        principalColumn: "CustomerPolicyNo");
                    table.ForeignKey(
                        name: "FK_DivisaranaTbls_Insuarances_InsuranceId",
                        column: x => x.InsuranceId,
                        principalTable: "Insuarances",
                        principalColumn: "InsuranceId");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "HealthInsuarances",
                columns: table => new
                {
                    PolicyNo = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    InsuranceId = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_HealthInsuarances", x => x.PolicyNo);
                    table.ForeignKey(
                        name: "FK_HealthInsuarances_Insuarances_InsuranceId",
                        column: x => x.InsuranceId,
                        principalTable: "Insuarances",
                        principalColumn: "InsuranceId");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "LoanTbls",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    PolicyNo = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    InsuranceId = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    CustomerPolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_LoanTbls", x => x.Id);
                    table.ForeignKey(
                        name: "FK_LoanTbls_Insuarances_InsuranceId",
                        column: x => x.InsuranceId,
                        principalTable: "Insuarances",
                        principalColumn: "InsuranceId");
                    table.ForeignKey(
                        name: "FK_LoanTbls_LoanCustomers_CustomerPolicyNo",
                        column: x => x.CustomerPolicyNo,
                        principalTable: "LoanCustomers",
                        principalColumn: "CustomerPolicyNo");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "SavingReliefs",
                columns: table => new
                {
                    PolicyNo = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    InsuranceId = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SavingReliefs", x => x.PolicyNo);
                    table.ForeignKey(
                        name: "FK_SavingReliefs_Insuarances_InsuranceId",
                        column: x => x.InsuranceId,
                        principalTable: "Insuarances",
                        principalColumn: "InsuranceId");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Treasuaries",
                columns: table => new
                {
                    PolicyNo = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    InsuranceId = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Treasuaries", x => x.PolicyNo);
                    table.ForeignKey(
                        name: "FK_Treasuaries_Insuarances_InsuranceId",
                        column: x => x.InsuranceId,
                        principalTable: "Insuarances",
                        principalColumn: "InsuranceId");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "BankingInsuaranceCompenstaions",
                columns: table => new
                {
                    BankingInsuaranceCompenstaionID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Value = table.Column<double>(type: "double", nullable: false),
                    Data = table.Column<DateOnly>(type: "date", nullable: false),
                    Comment = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    PolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BankingInsuaranceCompenstaions", x => x.BankingInsuaranceCompenstaionID);
                    table.ForeignKey(
                        name: "FK_BankingInsuaranceCompenstaions_BankingInsuarances_PolicyNo",
                        column: x => x.PolicyNo,
                        principalTable: "BankingInsuarances",
                        principalColumn: "PolicyNo");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "BankingInsuaranceDatas",
                columns: table => new
                {
                    DataId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Date = table.Column<DateOnly>(type: "date", nullable: false),
                    Amount = table.Column<double>(type: "double", nullable: false),
                    PolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BankingInsuaranceDatas", x => x.DataId);
                    table.ForeignKey(
                        name: "FK_BankingInsuaranceDatas_BankingInsuarances_PolicyNo",
                        column: x => x.PolicyNo,
                        principalTable: "BankingInsuarances",
                        principalColumn: "PolicyNo");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "BuildiingInsuranceCompenstaions",
                columns: table => new
                {
                    BuildiingInsuranceCompenstaionID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Value = table.Column<double>(type: "double", nullable: false),
                    Data = table.Column<DateOnly>(type: "date", nullable: false),
                    Comment = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    PolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BuildiingInsuranceCompenstaions", x => x.BuildiingInsuranceCompenstaionID);
                    table.ForeignKey(
                        name: "FK_BuildiingInsuranceCompenstaions_BuildingInsuarances_PolicyNo",
                        column: x => x.PolicyNo,
                        principalTable: "BuildingInsuarances",
                        principalColumn: "PolicyNo");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "BuildingInsuaranceDatas",
                columns: table => new
                {
                    DataId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Date = table.Column<DateOnly>(type: "date", nullable: false),
                    Amount = table.Column<double>(type: "double", nullable: false),
                    PolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BuildingInsuaranceDatas", x => x.DataId);
                    table.ForeignKey(
                        name: "FK_BuildingInsuaranceDatas_BuildingInsuarances_PolicyNo",
                        column: x => x.PolicyNo,
                        principalTable: "BuildingInsuarances",
                        principalColumn: "PolicyNo");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "HealthInsuaranceDatas",
                columns: table => new
                {
                    DataId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Date = table.Column<DateOnly>(type: "date", nullable: false),
                    Amount = table.Column<double>(type: "double", nullable: false),
                    PolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_HealthInsuaranceDatas", x => x.DataId);
                    table.ForeignKey(
                        name: "FK_HealthInsuaranceDatas_HealthInsuarances_PolicyNo",
                        column: x => x.PolicyNo,
                        principalTable: "HealthInsuarances",
                        principalColumn: "PolicyNo");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "HealthInsuranceCompenstaions",
                columns: table => new
                {
                    HealthInsuranceCompenstaionID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Value = table.Column<double>(type: "double", nullable: false),
                    Data = table.Column<DateOnly>(type: "date", nullable: false),
                    Comment = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    PolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_HealthInsuranceCompenstaions", x => x.HealthInsuranceCompenstaionID);
                    table.ForeignKey(
                        name: "FK_HealthInsuranceCompenstaions_HealthInsuarances_PolicyNo",
                        column: x => x.PolicyNo,
                        principalTable: "HealthInsuarances",
                        principalColumn: "PolicyNo");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "SavingReliefCompensations",
                columns: table => new
                {
                    MemberId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    MemberName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    MemberAddress = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    DeathpersonName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Reason = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Realtion = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ReasonDate = table.Column<DateOnly>(type: "date", nullable: false),
                    CompensationValue = table.Column<double>(type: "double", nullable: false),
                    RemainingBalanece = table.Column<double>(type: "double", nullable: false),
                    Schoolname = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Studentname = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Universityname = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    PolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SavingReliefCompensations", x => x.MemberId);
                    table.ForeignKey(
                        name: "FK_SavingReliefCompensations_SavingReliefs_PolicyNo",
                        column: x => x.PolicyNo,
                        principalTable: "SavingReliefs",
                        principalColumn: "PolicyNo");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "SavingReliefDatas",
                columns: table => new
                {
                    DataId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Date = table.Column<DateOnly>(type: "date", nullable: false),
                    Amount = table.Column<double>(type: "double", nullable: false),
                    PolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SavingReliefDatas", x => x.DataId);
                    table.ForeignKey(
                        name: "FK_SavingReliefDatas_SavingReliefs_PolicyNo",
                        column: x => x.PolicyNo,
                        principalTable: "SavingReliefs",
                        principalColumn: "PolicyNo");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "TreasuaryDatas",
                columns: table => new
                {
                    DataId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Date = table.Column<DateOnly>(type: "date", nullable: false),
                    Amount = table.Column<double>(type: "double", nullable: false),
                    PolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TreasuaryDatas", x => x.DataId);
                    table.ForeignKey(
                        name: "FK_TreasuaryDatas_Treasuaries_PolicyNo",
                        column: x => x.PolicyNo,
                        principalTable: "Treasuaries",
                        principalColumn: "PolicyNo");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "TreasuaryesCollections",
                columns: table => new
                {
                    TreasuaryeId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    TreasuaryName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Date = table.Column<DateOnly>(type: "date", nullable: false),
                    PolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TreasuaryesCollections", x => x.TreasuaryeId);
                    table.ForeignKey(
                        name: "FK_TreasuaryesCollections_Treasuaries_PolicyNo",
                        column: x => x.PolicyNo,
                        principalTable: "Treasuaries",
                        principalColumn: "PolicyNo");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "TreasuraryInsuranceCompenstaions",
                columns: table => new
                {
                    TreasuraryInsuranceCompenstaionID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Value = table.Column<double>(type: "double", nullable: false),
                    Data = table.Column<DateOnly>(type: "date", nullable: false),
                    Comment = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    PolicyNo = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TreasuraryInsuranceCompenstaions", x => x.TreasuraryInsuranceCompenstaionID);
                    table.ForeignKey(
                        name: "FK_TreasuraryInsuranceCompenstaions_Treasuaries_PolicyNo",
                        column: x => x.PolicyNo,
                        principalTable: "Treasuaries",
                        principalColumn: "PolicyNo");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "IX_BankingInsuaranceCompenstaions_PolicyNo",
                table: "BankingInsuaranceCompenstaions",
                column: "PolicyNo");

            migrationBuilder.CreateIndex(
                name: "IX_BankingInsuaranceDatas_PolicyNo",
                table: "BankingInsuaranceDatas",
                column: "PolicyNo");

            migrationBuilder.CreateIndex(
                name: "IX_BankingInsuarances_InsuranceId",
                table: "BankingInsuarances",
                column: "InsuranceId");

            migrationBuilder.CreateIndex(
                name: "IX_Branches_ZoneId",
                table: "Branches",
                column: "ZoneId");

            migrationBuilder.CreateIndex(
                name: "IX_BuildiingInsuranceCompenstaions_PolicyNo",
                table: "BuildiingInsuranceCompenstaions",
                column: "PolicyNo");

            migrationBuilder.CreateIndex(
                name: "IX_BuildingInsuaranceDatas_PolicyNo",
                table: "BuildingInsuaranceDatas",
                column: "PolicyNo");

            migrationBuilder.CreateIndex(
                name: "IX_BuildingInsuarances_InsuranceId",
                table: "BuildingInsuarances",
                column: "InsuranceId");

            migrationBuilder.CreateIndex(
                name: "IX_DivisaranaAbhiperanas_BranchId",
                table: "DivisaranaAbhiperanas",
                column: "BranchId");

            migrationBuilder.CreateIndex(
                name: "IX_DivisaranaCircleDates_CustomerPolicyNo",
                table: "DivisaranaCircleDates",
                column: "CustomerPolicyNo");

            migrationBuilder.CreateIndex(
                name: "IX_DivisaranaCompensations_CustomerPolicyNo",
                table: "DivisaranaCompensations",
                column: "CustomerPolicyNo");

            migrationBuilder.CreateIndex(
                name: "IX_DivisaranaParithoshithas_BranchId",
                table: "DivisaranaParithoshithas",
                column: "BranchId");

            migrationBuilder.CreateIndex(
                name: "IX_DivisaranaPayments_CustomerPolicyNo",
                table: "DivisaranaPayments",
                column: "CustomerPolicyNo");

            migrationBuilder.CreateIndex(
                name: "IX_DivisaranaSuccssors_CustomerPolicyNo",
                table: "DivisaranaSuccssors",
                column: "CustomerPolicyNo");

            migrationBuilder.CreateIndex(
                name: "IX_DivisaranaTbls_CustomerPolicyNo",
                table: "DivisaranaTbls",
                column: "CustomerPolicyNo");

            migrationBuilder.CreateIndex(
                name: "IX_DivisaranaTbls_InsuranceId",
                table: "DivisaranaTbls",
                column: "InsuranceId");

            migrationBuilder.CreateIndex(
                name: "IX_HealthInsuaranceDatas_PolicyNo",
                table: "HealthInsuaranceDatas",
                column: "PolicyNo");

            migrationBuilder.CreateIndex(
                name: "IX_HealthInsuarances_InsuranceId",
                table: "HealthInsuarances",
                column: "InsuranceId");

            migrationBuilder.CreateIndex(
                name: "IX_HealthInsuranceCompenstaions_PolicyNo",
                table: "HealthInsuranceCompenstaions",
                column: "PolicyNo");

            migrationBuilder.CreateIndex(
                name: "IX_Insuarances_BranchId",
                table: "Insuarances",
                column: "BranchId");

            migrationBuilder.CreateIndex(
                name: "IX_Insuarances_InsuranceProductID",
                table: "Insuarances",
                column: "InsuranceProductID");

            migrationBuilder.CreateIndex(
                name: "IX_LoanCompenstaions_CustomerPolicyNo",
                table: "LoanCompenstaions",
                column: "CustomerPolicyNo");

            migrationBuilder.CreateIndex(
                name: "IX_LoanPayments_CustomerPolicyNo",
                table: "LoanPayments",
                column: "CustomerPolicyNo");

            migrationBuilder.CreateIndex(
                name: "IX_LoanTbls_CustomerPolicyNo",
                table: "LoanTbls",
                column: "CustomerPolicyNo");

            migrationBuilder.CreateIndex(
                name: "IX_LoanTbls_InsuranceId",
                table: "LoanTbls",
                column: "InsuranceId");

            migrationBuilder.CreateIndex(
                name: "IX_SavingReliefCompensations_PolicyNo",
                table: "SavingReliefCompensations",
                column: "PolicyNo");

            migrationBuilder.CreateIndex(
                name: "IX_SavingReliefDatas_PolicyNo",
                table: "SavingReliefDatas",
                column: "PolicyNo");

            migrationBuilder.CreateIndex(
                name: "IX_SavingReliefParithoshithas_BranchId",
                table: "SavingReliefParithoshithas",
                column: "BranchId");

            migrationBuilder.CreateIndex(
                name: "IX_SavingReliefs_InsuranceId",
                table: "SavingReliefs",
                column: "InsuranceId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Treasuaries_InsuranceId",
                table: "Treasuaries",
                column: "InsuranceId");

            migrationBuilder.CreateIndex(
                name: "IX_TreasuaryDatas_PolicyNo",
                table: "TreasuaryDatas",
                column: "PolicyNo");

            migrationBuilder.CreateIndex(
                name: "IX_TreasuaryesCollections_PolicyNo",
                table: "TreasuaryesCollections",
                column: "PolicyNo");

            migrationBuilder.CreateIndex(
                name: "IX_TreasuraryInsuranceCompenstaions_PolicyNo",
                table: "TreasuraryInsuranceCompenstaions",
                column: "PolicyNo");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "BankingInsuaranceCompenstaions");

            migrationBuilder.DropTable(
                name: "BankingInsuaranceDatas");

            migrationBuilder.DropTable(
                name: "BuildiingInsuranceCompenstaions");

            migrationBuilder.DropTable(
                name: "BuildingInsuaranceDatas");

            migrationBuilder.DropTable(
                name: "DivisaranaAbhiperanas");

            migrationBuilder.DropTable(
                name: "DivisaranaCircleDates");

            migrationBuilder.DropTable(
                name: "DivisaranaCompensations");

            migrationBuilder.DropTable(
                name: "DivisaranaParithoshithas");

            migrationBuilder.DropTable(
                name: "DivisaranaPayments");

            migrationBuilder.DropTable(
                name: "DivisaranaSuccssors");

            migrationBuilder.DropTable(
                name: "DivisaranaTbls");

            migrationBuilder.DropTable(
                name: "HealthInsuaranceDatas");

            migrationBuilder.DropTable(
                name: "HealthInsuranceCompenstaions");

            migrationBuilder.DropTable(
                name: "LoanCompenstaions");

            migrationBuilder.DropTable(
                name: "LoanPayments");

            migrationBuilder.DropTable(
                name: "LoanTbls");

            migrationBuilder.DropTable(
                name: "SavingReliefCompensations");

            migrationBuilder.DropTable(
                name: "SavingReliefDatas");

            migrationBuilder.DropTable(
                name: "SavingReliefParithoshithas");

            migrationBuilder.DropTable(
                name: "TreasuaryDatas");

            migrationBuilder.DropTable(
                name: "TreasuaryesCollections");

            migrationBuilder.DropTable(
                name: "TreasuraryInsuranceCompenstaions");

            migrationBuilder.DropTable(
                name: "BankingInsuarances");

            migrationBuilder.DropTable(
                name: "BuildingInsuarances");

            migrationBuilder.DropTable(
                name: "DivisaranaDatas");

            migrationBuilder.DropTable(
                name: "HealthInsuarances");

            migrationBuilder.DropTable(
                name: "LoanCustomers");

            migrationBuilder.DropTable(
                name: "SavingReliefs");

            migrationBuilder.DropTable(
                name: "Treasuaries");

            migrationBuilder.DropTable(
                name: "Insuarances");

            migrationBuilder.DropTable(
                name: "Branches");

            migrationBuilder.DropTable(
                name: "InsuranceProducts");

            migrationBuilder.DropTable(
                name: "Zones");
        }
    }
}
