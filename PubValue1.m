function [shouldPublish, expectedReturn] = PubValue1(ValueSuc, ValueFail, Fee, ProbSuc, ProbPosSuc, ProbPosFail, NPos, NNeg)
    
    notPublishAfterReview = -(NPos + NNeg) * Fee;
    shouldPublish = false;

    condProbSuc = ProbSuccess(ProbSuc, ProbPosSuc, ProbPosFail, NPos, NNeg);
    
    expectedReturn = (condProbSuc * ValueSuc) - ((1 - condProbSuc) * ValueFail) - (NPos + NNeg) * Fee;


    if expectedReturn > notPublishAfterReview
        shouldPublish = true;
    else
        expectedReturn = notPublishAfterReview;
    end
    

    disp(expectedReturn);
    disp(shouldPublish);

end

function condProbSuccess = ProbSuccess(ProbSuc, ProbPosSuc, ProbPosFail, NPos, NNeg)
    
    probReviewsGivenSuccess = (ProbPosSuc^NPos) * ((1 - ProbPosSuc)^NNeg);
    
    probReviewsGivenFailure = (ProbPosFail^NPos) * ((1 - ProbPosFail)^NNeg);
    
    condProbSuccess = (probReviewsGivenSuccess * ProbSuc) / ...
        ((probReviewsGivenSuccess * ProbSuc) + (probReviewsGivenFailure * (1 - ProbSuc)));
end