CREATE INDEX idx_egcl_paymentdetail_paymentid ON public.egcl_paymentdetail USING btree (tenantid, paymentid);
CREATE INDEX idx_egcl_billdetial_billdetail_billid ON public.egcl_billdetial USING btree (tenantid, billid);
CREATE INDEX idx_egcl_payment_transactiondate2 ON public.egcl_payment USING btree (tenantid, transactiondate DESC NULLS LAST, paymentstatus);