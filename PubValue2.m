function expectedReturn = PubValue2(ValueSuc, ValueFail, Fee, ProbSuc, ProbPosSuc, ProbPosFail, N)
 
    expReturnPublish = 0;
    
   
    expReturnNotPublish = -N * Fee;

    for NPos = 0:N
        binomProbSuc = nchoosek(N, NPos) * (ProbPosSuc^NPos) * ((1 - ProbPosSuc)^(N - NPos));
        binomProbFail = nchoosek(N, NPos) * (ProbPosFail^NPos) * ((1 - ProbPosFail)^(N - NPos));
        
        

        weightedProbSuc = binomProbSuc * ProbSuc;
        weightedProbFail = binomProbFail * (1 - ProbSuc);

        totalProbNPos = weightedProbSuc + weightedProbFail;

        disp(totalProbNPos);
        
        expReturnForNPos = PubValue1(ValueSuc, ValueFail, Fee, ProbSuc, ProbPosSuc, ProbPosFail, NPos, N-NPos);
        
        disp(expReturnForNPos);

        expReturnPublish = expReturnPublish + totalProbNPos * expReturnForNPos ;
    end
    
    expectedReturn = max(expReturnPublish, expReturnNotPublish);
end

function expectedReturn = PubValue1(ValueSuc, ValueFail, Fee, ProbSuc, ProbPosSuc, ProbPosFail, NPos, NNeg)
    
    notPublishAfterReview = -(NPos + NNeg) * Fee;
    condProbSuc = ProbSuccess(ProbSuc, ProbPosSuc, ProbPosFail, NPos, NNeg);
    
    expectedReturn = (condProbSuc * ValueSuc) - ((1 - condProbSuc) * ValueFail) - (NPos + NNeg) * Fee;
    
    if expectedReturn < notPublishAfterReview
        expectedReturn = notPublishAfterReview;
    end
end

function condProbSuccess = ProbSuccess(ProbSuc, ProbPosSuc, ProbPosFail, NPos, NNeg)
    
    probReviewsGivenSuccess = (ProbPosSuc^NPos) * ((1 - ProbPosSuc)^NNeg);
    
    probReviewsGivenFailure = (ProbPosFail^NPos) * ((1 - ProbPosFail)^NNeg);
    
    condProbSuccess = (probReviewsGivenSuccess * ProbSuc) / ...
        ((probReviewsGivenSuccess * ProbSuc) + (probReviewsGivenFailure * (1 - ProbSuc)));
end
