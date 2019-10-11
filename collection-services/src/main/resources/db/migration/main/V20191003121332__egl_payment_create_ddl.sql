CREATE TABLE egcl_payment (
  	id VARCHAR(256) NOT NULL,
  	tenantId VARCHAR(256) NOT NULL,
  	totalDue numeric(12,2) NOT NULL,
  	totalAmountPaid numeric(12,2) NOT NULL,
  	transactionNumber VARCHAR(256) NOT NULL,
  	transactionDate BIGINT NOT NULL,
  	paymentMode VARCHAR(64) NOT NULL,
  	instrumentDate BIGINT NOT NULL,
  	instrumentNumber VARCHAR(256) NOT NULL,
    instrumentStatus VARCHAR(256) NOT NULL,
  	ifscCode VARCHAR(64) NOT NULL,
  	additionalDetails JSONB,
  	paidBy VARCHAR(256) ,
  	mobileNumber VARCHAR(64) NOT NULL,
  	payerName VARCHAR(256) NOT NULL,
  	payerAddress VARCHAR(1024) NOT NULL,
  	payerEmail VARCHAR(256) NOT NULL,
  	payerId VARCHAR(256) NOT NULL,
  	paymentStatus VARCHAR(256) NOT NULL,
  	createdBy VARCHAR(256) NOT NULL,
  	createdDate BIGINT NOT NULL,
  	lastModifiedBy VARCHAR(256) NOT NULL,
  	lastModifiedDate BIGINT NOT NULL,

	CONSTRAINT pk_egcl_payment PRIMARY KEY (id)

);

CREATE INDEX IF NOT EXISTS idx_egcl_payment_transactionNumber ON egcl_payment(transactionNumber);
CREATE INDEX IF NOT EXISTS idx_egcl_payment_payerId ON egcl_payment(payerId);
CREATE INDEX IF NOT EXISTS idx_egcl_payment_mobileNumber ON egcl_payment(mobileNumber);



CREATE TABLE egcl_paymentDetail (
    id VARCHAR(256) NOT NULL,
  	tenantId VARCHAR(256) NOT NULL,
  	paymentid VARCHAR(256) NOT NULL,
  	due numeric(12,2) NOT NULL,
  	amountPaid numeric(12,2) NOT NULL,
  	receiptNumber VARCHAR(256) NOT NULL,
  	businessService VARCHAR(256) NOT NULL,
  	billId VARCHAR(256) NOT NULL,
	additionalDetails JSONB,
	createdBy VARCHAR(256) NOT NULL,
  	createdDate BIGINT NOT NULL,
  	lastModifiedBy VARCHAR(256) NOT NULL,
  	lastModifiedDate BIGINT NOT NULL,

  	CONSTRAINT pk_egcl_paymentDetail PRIMARY KEY (id),
    CONSTRAINT uk_egcl_paymentDetail UNIQUE (billId),
    CONSTRAINT fk_egcl_paymentDetail FOREIGN KEY (paymentid) REFERENCES egcl_payment(id)

  	ON UPDATE CASCADE
	ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_egcl_paymentDetail_receiptNumber ON egcl_paymentDetail(receiptNumber);
CREATE INDEX IF NOT EXISTS idx_egcl_paymentDetail_billId ON egcl_paymentDetail(billId);



CREATE TABLE egcl_bill(
        	id VARCHAR(256) NOT NULL,
        	status VARCHAR(256) NOT NULL,
        	isCancelled boolean NOT NULL,
        	additionalDetails JSONB,
        	tenantId VARCHAR(256) NOT NULL,
        	collectionModesNotAllowed VARCHAR(256),
        	partPaymentAllowed boolean,
        	isAdvanceAllowed boolean,
        	minimumAmountToBePaid numeric(12,2),
        	businessService VARCHAR(256) NOT NULL,
        	totalAmount numeric(12,2) NOT NULL,
        	consumerCode VARCHAR(256) NOT NULL,
        	billNumber VARCHAR(256) NOT NULL,
	    	billDate BIGINT NOT NULL,
	    	reasonForCancellation VARCHAR(2048),
        	createdBy VARCHAR(256) NOT NULL,
		    createdDate BIGINT NOT NULL,
		    lastModifiedBy VARCHAR(256) NOT NULL,
		    lastModifiedDate BIGINT NOT NULL,

	   	    CONSTRAINT pk_egcl_bill PRIMARY KEY (id),
            CONSTRAINT fk_egcl_bill FOREIGN KEY (id) REFERENCES egcl_paymentdetail(billid)
);

CREATE INDEX IF NOT EXISTS idx_egcl_bill_consumerCode ON egcl_bill(consumerCode);


CREATE TABLE egcl_billdetial(
        	id VARCHAR(256) NOT NULL,
		    tenantId VARCHAR(256) NOT NULL,
		    demandId VARCHAR(256) NOT NULL,
        	billId VARCHAR(256) NOT NULL,
        	amount numeric(12,2) NOT NULL,
        	amountPaid numeric(12,2) NOT NULL,
        	fromPeriod BIGINT NOT NULL,
        	toPeriod BIGINT NOT NULL,
        	collectedAmount numeric(12,2) NOT NULL,
        	additionalDetails VARCHAR(256) NOT NULL,
        	receiptNumber VARCHAR(256) NOT NULL,
        	receiptDate BIGINT NOT NULL,
        	receiptType VARCHAR(256) NOT NULL,
        	channel VARCHAR(256),
        	voucherHeader VARCHAR(256),
        	boundary VARCHAR(256),
        	manualReceiptNumber VARCHAR(256),
        	manualReceiptDate BIGINT,
            collectionType VARCHAR(256) NOT NULL,
        	billDescription VARCHAR(256),
        	expiryDate VARCHAR(256) NOT NULL,
        	displayMessage VARCHAR(2048),
        	callBackForApportioning VARCHAR(256) NOT NULL,
        	cancellationRemarks VARCHAR(2048),
		    createdBy VARCHAR(256) NOT NULL,
		    createdDate BIGINT NOT NULL,
		    lastModifiedBy VARCHAR(256) NOT NULL,
    		lastModifiedDate BIGINT NOT NULL,

		CONSTRAINT pk_egcl_billdetial PRIMARY KEY (id),
        CONSTRAINT fk_egcl_billdetial FOREIGN KEY (billId) REFERENCES egcl_bill(id)
);



CREATE TABLE egcl_billAccountDetail (
    id VARCHAR(256) NOT NULL,
  	tenantId VARCHAR(256) NOT NULL,
  	billDetailid VARCHAR(256) NOT NULL,
	demandDetailId VARCHAR(256) NOT NULL,
  	"order" Integer NOT NULL,
  	amount numeric(12,2) NOT NULL,
  	isActualDemand Boolean NOT NULL,
  	taxHeadCode VARCHAR(256) NOT NULL,
	additionalDetails JSONB,
	createdBy VARCHAR(256) NOT NULL,
  	createdDate BIGINT NOT NULL,
  	lastModifiedBy VARCHAR(256) NOT NULL,
  	lastModifiedDate BIGINT NOT NULL,

  	CONSTRAINT pk_egcl_payment_taxhead PRIMARY KEY (id),
    CONSTRAINT fk_egcl_payment_taxhead FOREIGN KEY (demandDetailId) REFERENCES egcl_billdetial(id)

  	ON UPDATE CASCADE
	ON DELETE CASCADE
);


CREATE TABLE egcl_payment_audit (
  	id VARCHAR(256) NOT NULL,
  	tenantId VARCHAR(256) NOT NULL,
  	totalDue numeric(12,2) NOT NULL,
  	totalAmountPaid numeric(12,2) NOT NULL,
  	transactionNumber VARCHAR(256) NOT NULL,
  	transactionDate BIGINT NOT NULL,
  	paymentMode VARCHAR(64) NOT NULL,
  	instrumentDate BIGINT NOT NULL,
  	instrumentNumber VARCHAR(256) NOT NULL,
    instrumentStatus VARCHAR(256) NOT NULL,
  	ifscCode VARCHAR(64) NOT NULL,
  	additionalDetails JSONB,
  	paidBy VARCHAR(256) ,
  	mobileNumber VARCHAR(64) NOT NULL,
  	payerName VARCHAR(256) NOT NULL,
  	payerAddress VARCHAR(1024) NOT NULL,
  	payerEmail VARCHAR(256) NOT NULL,
  	payerId VARCHAR(256) NOT NULL,
  	paymentStatus VARCHAR(256) NOT NULL,
  	createdBy VARCHAR(256) NOT NULL,
  	createdDate BIGINT NOT NULL,
  	lastModifiedBy VARCHAR(256) NOT NULL,
  	lastModifiedDate BIGINT NOT NULL

);


CREATE TABLE egcl_paymentDetail_audit (
    id VARCHAR(256) NOT NULL,
  	tenantId VARCHAR(256) NOT NULL,
  	paymentid VARCHAR(256) NOT NULL,
  	due numeric(12,2) NOT NULL,
  	amountPaid numeric(12,2) NOT NULL,
  	receiptNumber VARCHAR(256) NOT NULL,
  	businessService VARCHAR(256) NOT NULL,
  	billId VARCHAR(256) NOT NULL,
	additionalDetails JSONB,
	createdBy VARCHAR(256) NOT NULL,
  	createdDate BIGINT NOT NULL,
  	lastModifiedBy VARCHAR(256) NOT NULL,
  	lastModifiedDate BIGINT NOT NULL
);


CREATE TABLE egcl_bill_audit(
        	id VARCHAR(256) NOT NULL,
        	status VARCHAR(256) NOT NULL,
        	isCancelled boolean NOT NULL,
        	additionalDetails JSONB,
        	tenantId VARCHAR(256) NOT NULL,
        	collectionModesNotAllowed VARCHAR(256),
        	partPaymentAllowed boolean,
        	isAdvanceAllowed boolean,
        	minimumAmountToBePaid numeric(12,2),
        	businessService VARCHAR(256) NOT NULL,
        	totalAmount numeric(12,2) NOT NULL,
        	consumerCode VARCHAR(256) NOT NULL,
        	billNumber VARCHAR(256) NOT NULL,
	    	billDate BIGINT NOT NULL,
	    	reasonForCancellation VARCHAR(2048),
        	createdBy VARCHAR(256) NOT NULL,
		    createdDate BIGINT NOT NULL,
		    lastModifiedBy VARCHAR(256) NOT NULL,
		    lastModifiedDate BIGINT NOT NULL
);
