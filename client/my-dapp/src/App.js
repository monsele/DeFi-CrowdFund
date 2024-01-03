import { BrowserRouter, Routes, Route } from 'react-router-dom';


import CampaignList from './pages/CampaignList';
import FundCampaign from './pages/FundCampaign';
import SuccessPage from './pages/SuccessPage';

function App() {
  return (
    // <BrowserRouter>
    <Routes>
        <Route path="/" element={<CampaignList />} />
        <Route path="/fund" element={<FundCampaign />} />
        <Route path="/success" element={<SuccessPage />} />
    </Routes>
// </BrowserRouter>
  );
}

export default App;
