import { authenticate } from "../shopify.server";

export const loader = async ({ request }) => {
  try {
      const response = await authenticate.admin(request);
      console.log('daniel  after authenticate.adminn');
      const responseBody = await response.text(); // or response.json() if the response is JSON
      console.log('Response body:', responseBody);
  } catch (error) {
      console.error('Error in  auth.$ loader', error);
  }

  return null;
};
