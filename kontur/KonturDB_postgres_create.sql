CREATE TABLE "planes_data" (
	"id_plane" serial(255) NOT NULL DEFAULT 'NULL',
	"type_modificate_plane" varchar(255) NOT NULL DEFAULT 'NULL',
	"production_date" DATE NOT NULL DEFAULT 'NULL',
	"factory_number" integer(255) NOT NULL UNIQUE DEFAULT 'NULL',
	"tail_number" integer(255) NOT NULL DEFAULT 'NULL',
	"condition" varchar(255) NOT NULL DEFAULT 'NULL',
	"assigned_resource_hours" integer(255) NOT NULL DEFAULT 'NULL',
	"assigned_resource_years" integer(255) NOT NULL DEFAULT 'NULL',
	"overhaul_resource_hours" integer(255) NOT NULL DEFAULT 'NULL',
	"overhaul_resource_years" integer(255) NOT NULL DEFAULT 'NULL',
	"flight_time_ZPE" integer(255) NOT NULL DEFAULT 'NULL',
	"flight_time_POR" integer(255) NOT NULL DEFAULT 'NULL',
	"landing_ZPE" integer(255) NOT NULL DEFAULT 'NULL',
	"landing_POR" integer(255) NOT NULL DEFAULT 'NULL',
	"repairs_sum" integer(255) NOT NULL DEFAULT 'NULL',
	"last_repair_date" DATE NOT NULL DEFAULT 'NULL',
	"type_modificate_engine" varchar(255) NOT NULL DEFAULT 'NULL',
	"engine_sum" varchar(255) NOT NULL DEFAULT 'NULL',
	CONSTRAINT "planes_data_pk" PRIMARY KEY ("id_plane")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "engines_data" (
	"id_engine" serial NOT NULL UNIQUE DEFAULT 'NULL',
	"id_plane_fk" DATE(255) NOT NULL DEFAULT 'NULL',
	"type_modificate_engine" varchar(255) NOT NULL DEFAULT 'NULL',
	"factory_number" integer(255) NOT NULL UNIQUE DEFAULT 'NULL',
	"production_date" DATE NOT NULL DEFAULT 'NULL',
	"condition" varchar(255) NOT NULL DEFAULT 'NULL',
	"assigned_resource_hours" integer(255) NOT NULL DEFAULT 'NULL',
	"assigned_resource_years" integer(255) NOT NULL DEFAULT 'NULL',
	"overhaul_resource_hours" integer(255) NOT NULL DEFAULT 'NULL',
	"overhaul_resource_years" integer(255) NOT NULL DEFAULT 'NULL',
	"operating_time_ZPE" integer(255) NOT NULL DEFAULT 'NULL',
	"operating_time_POR" integer(255) NOT NULL DEFAULT 'NULL',
	"repairs_sum" integer(255) NOT NULL DEFAULT 'NULL',
	"last_repair_date" DATE NOT NULL DEFAULT 'NULL',
	CONSTRAINT "engines_data_pk" PRIMARY KEY ("id_engine")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "failure_data" (
	"id_failure" serial NOT NULL UNIQUE,
	"id_plane_fk" integer NOT NULL,
	"specialty" varchar(255) NOT NULL DEFAULT 'NULL',
	"id_engine_fk" varchar(255) NOT NULL DEFAULT 'NULL',
	"system_subsystem" varchar(255) NOT NULL DEFAULT 'NULL',
	"failure_date" DATE NOT NULL DEFAULT 'NULL',
	"сircumstances_failure" TEXT NOT NULL DEFAULT 'NULL',
	"reason_failure" TEXT NOT NULL DEFAULT 'NULL',
	"identified" varchar(255) NOT NULL DEFAULT 'NULL',
	"causation" varchar(255) NOT NULL DEFAULT 'NULL',
	"feedback" varchar(255) NOT NULL DEFAULT 'NULL',
	"way_to_eliminate" TEXT NOT NULL DEFAULT 'NULL',
	"measures_taken" TEXT NOT NULL DEFAULT 'NULL',
	CONSTRAINT "failure_data_pk" PRIMARY KEY ("id_failure")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "engines_data" ADD CONSTRAINT "engines_data_fk0" FOREIGN KEY ("id_plane_fk") REFERENCES "planes_data"("id_plane");

ALTER TABLE "failure_data" ADD CONSTRAINT "failure_data_fk0" FOREIGN KEY ("id_plane_fk") REFERENCES "planes_data"("id_plane");
ALTER TABLE "failure_data" ADD CONSTRAINT "failure_data_fk1" FOREIGN KEY ("id_engine_fk") REFERENCES "engines_data"("id_engine");

