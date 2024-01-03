import {TableComponent} from '../components/table.js'
import React from 'react'

export default function CampaignList() {
  const myData = [
    { id: 1, name: 'Item 1', description: 'Description of item 1' },
    { id: 2, name: 'Item 2', description: 'Description of item 2' },
    { id: 3, name: 'Item 3', description: 'Description of item 3' },
  ];
  return (
    <TableComponent data={myData}/>
  )
}
